package com.tm.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * Redis的主要缺点是数据库容量受到物理内存的限制，不能用作海量数据的高性能读写， 因此Redis适合的场景主要局限在较小数据量的高性能操作和运算上。
 * 支持多种数据类型:链表，集合，数组，字符串（Lists，Sets 求交集、并集，Sorted Set ）。 redis的性能：
 * 这是官方给出的数据：SET操作每秒钟 110000 次，GET操作每秒钟 81000 次。
 * 实验中模拟了20个客户端对redis进行写操作。当数据库中的数据达到G数据级时，写速度会有明显的下降。 可能的原因:
 * 1、redis需要将数据同步到磁盘，占用了大量的CPU和内存； 2、key数量增大，需要重新布局； 3、消息队列中还存在大量请求，致使请求阻塞。
 * @author TmMarlon
 * 
 */
public class RedisClient {
	 
	  public static Logger log = Logger.getLogger(RedisClient.class);
	  /**
	   * jedis 连接池
	   */
	  private static JedisPool jedisPool;
	   
	  @Resource
	  public void setJedisPool(JedisPool jedisPool) {
	    RedisClient.jedisPool = jedisPool;
	  }
	 
	  /**
	   * 释放连接对象
	   * @Title:closeShardedJedis
	   * @param jedis
	   * @return void
	   * @throws
	   */
	  public static void closeJedis(Jedis jedis) {
	    if (null != jedis) {
	      jedisPool.returnResource(jedis);
	    }
	  }
	 
	  /**
	   * 释放异常的连接对象
	   * @Title:closeShardedJedis
	   * @param jedis
	   * @return void
	   * @throws
	   */
	  public static void closeBrokenJedis(Jedis jedis) {
	    if (null != jedis) {
	      jedisPool.returnBrokenResource(jedis);
	    }
	  }
	 
	  /**
	   * 获取连接对象
	   * @Title:getShardedJedis
	   * @return ShardedJedis
	   * @throws
	   */
	  public static Jedis getJedis() {
	    return jedisPool.getResource();
	  }
	 
	  /**
	   * 根据redis的key找到对应的值
	   * @param jediskey  redis键
	   * @return //返回redis储存信息
	   */
	  public static String getJedisVal(String jediskey) {
	    Jedis jedis = null;
	    try {
	      jedis = RedisClient.getJedis();
	      String value = jedis.get(jediskey);
	      return value;
	    } catch (Exception e) {
	      log.error("key:" + jediskey + "未能取到redis的值.");
	      closeBrokenJedis(jedis);
	      return null;
	    } finally {
	      closeJedis(jedis);
	    }
	  }
	 
	  /**
	   * 存储redis的键值不设置时间
	   * 
	   * @param jediskey     redis键
	   * @param jedisval  redis值
	   */
	  public static void setJedisVal(String jediskey, String jedisval) {
	    setJedisVal(jediskey, jedisval, 0);
	  }
	 
	  /**
	   * 设置时间存储redis
	   * @param jediskey  redis键
	   * @param jedisval     redis值
	   * @param seconds   时间(秒)
	   */
	  public static void setJedisVal(String jediskey, String jedisval, int seconds) {
	    Jedis jedis = null;
	    try {
	      jedis = RedisClient.getJedis();
	 
	      if (seconds > 0) {
	        jedis.setex(jediskey, seconds, jedisval);
	      } else {
	        jedis.set(jediskey, jedisval);
	      }
	    } catch (Exception e) {
	      e.printStackTrace();
	      closeBrokenJedis(jedis);
	    } finally {
	      closeJedis(jedis);
	    }
	  }
	 
	  /**
	   * 根据redis键值删除redis
	   * @param jediskey    键值
	   */
	  public static void delJedis(String jediskey) {
	    Jedis jedis = null;
	    try {
	      jedis = RedisClient.getJedis();
	      jedis.del(jediskey);
	    } catch (Exception e) {
	      e.printStackTrace();
	      closeBrokenJedis(jedis);
	    } finally {
	      closeJedis(jedis);
	    }
	  }
	   
	  /**
	   * 序列化
	   * @author renzhenjiang 
	   * @date 2014-9-30 下午04:09:03 
	   * @param object
	   * @return
	   * @see [类、类#方法、类#成员]
	   */
	   public static byte[] serialize(Object object) {
	     ObjectOutputStream oos = null;
	     ByteArrayOutputStream baos = null;
	     byte[] bytes = null;
	     try {
	 
	       //序列化
	       baos = new ByteArrayOutputStream();
	       oos = new ObjectOutputStream(baos);
	       oos.writeObject(object);
	       bytes = baos.toByteArray();
	     } catch (Exception e) {
	       System.out.println("序列化运行异常");
	     }
	     return bytes;
	 
	  }
	   /**
	    * 反序列化
	    * @author renzhenjiang 
	    * @date 2014-9-30 下午04:10:06 
	    * @param bytes
	    * @return
	    * @see [类、类#方法、类#成员]
	    */
	  public static Object unserialize(byte[] bytes) {
	     ByteArrayInputStream bais = null;
	     Object obj = null;
	     try {
	       //反序列化
	       bais = new ByteArrayInputStream(bytes);
	       ObjectInputStream ois = new ObjectInputStream(bais);
	       obj = ois.readObject();
	     } catch (Exception e) {
	       System.out.println("反序列化异常");
	     }
	     return obj;
	  }
	  public static void main(String[] args) {
	     
	    JedisPoolConfig config = new JedisPoolConfig();
	    config.setMaxActive(666300);
	    config.setMaxIdle(20);
	    config.setMaxWait(1000);
	    jedisPool = new JedisPool(config, "192.168.1.250", 6379);
	    Jedis jedis = jedisPool.getResource();
	     
	    System.out.println("statistics_18310813001reg1_count === "+jedis.get("statistics_18310813001reg1"));
	    System.out.println("statistics_18310813001reg2_count === "+jedis.get("statistics_18310813001reg2"));
	    System.out.println("statistics_18310813001pwd1_count === "+jedis.get("statistics_18310813001pwd1"));
	    System.out.println("statistics_18310813001pwd2_count === "+jedis.get("statistics_18310813001pwd2"));
	    //jedis.del("statistics_18310813001reg1");
	    //System.out.println("statistics_18310813001reg1_count === "+jedis.get("statistics_18310813001reg1"));
	  }
	   
	}