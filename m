Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5093313270
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 21 Nov 2025 12:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763729035; cv=none; b=sFHHwtSNxw/A5CmIjV89q6B9AR4m8WClrzZra2oGzI6y33d83w4tnwmiUzMePcIS1g9DsaYfd52n9Kcjnaxq887QnDrsKWfeBoSwLoAMCXmeaZTxYIwkLAjRnEg7FL6vglA8dLLIrQbhR5UGH7j+MPbyN8y4hOmgq7jRmjZjjUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763729035; c=relaxed/simple;
	bh=Lb5GzRKOSZX8uErlUTtdGAMFSRs2CCjbEtli8Qqo/TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=GePvTwFfh4UMTZ+f/xr5CD/NWBU4y1TIMUbXSuzsYZuHJyG4cdaUa8ORTNKpz/Qsq/x630VIyimC8R3ZDtQXEsg0X2vp0hmQqCupVkE+huFsRkxJfCG0LYc8wOOE6dtHanZK0iIY6OJFkQqntnUh9TLGqlxxDhlcpbFMDR/Y4lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=a9radqAo; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="a9radqAo"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63C9A843CE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 21 Nov 2025 12:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDVBEirLMyJr for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Nov 2025 12:43:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=98.137.68.30; helo=sonic308-54.consmr.mail.gq1.yahoo.com; envelope-from=adelodunolaoluwa@yahoo.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A3F4F843CA
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3F4F843CA
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=a9radqAo
Received: from sonic308-54.consmr.mail.gq1.yahoo.com (sonic308-54.consmr.mail.gq1.yahoo.com [98.137.68.30])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A3F4F843CA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 21 Nov 2025 12:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763729031; bh=41FWyJLJheggJINaicD2pRFpNKCqi/DDli1pFaxacmE=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=a9radqAo912JQNSttlaK2rqjCw+29DpCVtF/4dj9+fSyDkeKMfWFFkurDbSHiwpZc5S+LHxZBHkC1cnf2BfyIBH6+fgJN9uwN0YG2VrmOlFyTS5nhsSg+GKN22yfj7ER1qRR/FipE7QQQvp5e1Pho7S/ruZYdAY1nojIwea0POMcnDO4xZ50jzPzgNl/XrSLdzEvNCRcLZYu0bW7hdrBjqQi3uRx83iRgLhXItDI3WyUGu5xr03FtOcEMlqpM2/XTVlroR5oPmShHaisy8lT7peG4E5K+TmRstzwRGz6vZRsUfmXN5PPRKsmfb/IBqhOfM2Afg/TqU9wCqs9NevQpw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763729031; bh=qnjk1McdrR3DQvtezImgQywyWKMyUK/xbydnl4/fkUu=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=r1+KlzNrpaYq5h2kru/qp19+N6hEpnEyRSIW1RhYI4QkmPC7+qePFcmDlU80i6dYLtOq7KvgFXJ3ibgckRh8YcjGu5SOC1zc2ypXk3XxXn8bZXYQW3mzRzs/U9kgcaiYORKvMBDdzn68lSlYksOQ38TpUquTY5Brt16ng8nRtlSs/LcEt4f+vOWJJ6ch5L9pAIq6+XLYwqhnk+bw97SqtoZOcccq12Oj7/7iJOmYCm6KsXIaWAsqkk2/xvjSx0v/1IqihyW9Zqq6MkrjU3X40f8/YyLTsrAd53oMCnfF2qiJSfNCVAjAftFt0hmO5D+uIagAotMQksfm3J7F/w8jyw==
X-YMail-OSG: NRu06HAVM1kmjEtYifhT1s5CaJty3XzNOElEITZEm2ulpP8lYPq7zxbvBwB9U5G
 oOwkclRunemV50.prBKZKi4WWQ5S3xNDayEVNdcvywkeAnESGu6btiOiiBN0kJG9noGcOXXV.Lik
 Giy0RUvTNmH0aVqrF5Sg7JCDJH1fQGhTO.Khd7A.K9lCthnH_mMtJpmNccIGJmVjA0gomW.hljiR
 9dM30Wzr1xQokSCgr2xiISPs4jpvp35BjE3UXRpFJPDdS0wwbksYgWDTkj18sRmESDJ0MpF50rvh
 Ojmc2Qul7lGdRUAZvUfAYNblUXKNx60kd2WiZRbXspWIWRZ90DBPzYy2Tk1._R6cPrlcACnG8liU
 ZMdVCQb8X5PkRYjFuqG4GpHciifFB_GazrnP_Zgs3uZT0dB1335ejGu7V_Uj.s4eJbJL1svWKe35
 3lowBAbakjK69XfMD5L4g6jH6O5xWaZMiw1AZZMv7BdQGc.B.ERR.PQaOS_mg88bfqsYWV6BSHUm
 6NLMvHYvZKmGPzljjZqmTZJ6BmzqjOd3kgpaKsGLa1bKDkzpYWiYEnfkle.fjf6Ma66tSTjpgHFc
 t1ve9K0ci.uTVJO._3vCfk.y917aoIYnEV.YcgwSksGwCNclst.rqb_LYNabaI8QKRUnZkIlWv0.
 xZOtGck5I.pAeR8Gfnj_lbfiJBEZtp9qH55Oeb4_.SYslBJke0ucMGgKGUSNVqjkQC_pxGO1gJrc
 _pNHNh8HGdtweY5VmEJ6PnY8jl1jYgfJjemShnr1bF4OQYY29z7dnM.JGTuwTuqxjHEb0iF39vJu
 QlwptbrUEi01wZVqILoQEhQwpQ9d6qg_BDNbfo9ZTH0vKpdbsk6mL9wTvmmY29nRf7q66WnLhY3x
 MzoYd5A6ZfsOmxUozGoIPLbM84cvc5bLHVlozETecsn_B.2khcilDJPUa3gFDWPvNKNv1IinBoXn
 2UYfFh065mg5R0tSZ3bOpCL2C3Ka4LPk8ZRCCQFf7HT4t3nW4Ewz_3BXdASxwG3B.98Hl_sH3pUt
 lJp08wneECpipbR9Lzc3SXjfXofhmMW9foYD6poWMPWRs4VB4WK2lXk5eOwOx1qxiPFFWpYuV6ug
 HA1RHT8CTMX2mp7yAwsrkaOTzvfHB7DI2m6uxEYlyhvX9CB5qwijEKpYnl180btF12q5xwVu8C8k
 F5w4E2UV4N9R95UlLzbqIoeRkzhFN4n2HNAmzHoJF6EkSMGx4I2RGwIxoeJCtVlO_vCbG3SnoC6q
 XfZZaACI6VuWAgQTFwqQU1qv0KRSiyENydLxiES94IqmNBRCfCRZ47nwM.KBvRvl07w1hB70huUQ
 2Sc2zXhv.5plo09pXTkbknlwNN4HabZsQW3DErpeO9men.vvy7xXbVtD8k43.NldZcAi9gV9UOpj
 u1U7sdLonjVBcVosXC9G61I3BX1gEE226NZhkVkCw8XeVRR0OHePYSDUazRdNJ4wx1aOSX5W8CsK
 byZrKDAEEl2hMfx.RmGiyzmckVoeJzBEbPEdWDrkRsCHi0RrZez6Zz_Pma0b9uZdu9NP2UkM2BRQ
 F_xNRUlLbDsup.ZigZE7K8H8nXmsHgY8mNQhQ_p_8wF8B0O9XklH.9wTYIB.OwbuDEVdwz.Lgz5E
 1YToivmzC1TT1GttQ651jadpK9ndoG.wQJTpjSxTngXiSEi32rrirZexaM86L9bNYqPF5B2zOgyw
 Aulc2SWYMsCvluFeCwRnK2v9D5LJVzVyH_qQD0_ablmOE8a2NwGWpUFodOt2bwoyKSSgl31Jqbnl
 PWQDbLu6tXjGMo4go7E.l7rtOETPOoEgsCripDGLNHTBQkAaV1h3H3fgpwzrAm4I1jI6xTUc2vvR
 tFuyZ5g0Y0f_pRBdHjgshJfHs7zL.Uq.a7wTTnxQeBK.wPAQoRszOAfx5nUleO8fn5AT92YZ_wZ3
 Xdd0418OhZVybSDUhqv0Xif5znkDUydGjnofx5Vn7cywNufKrOjzQM1JaIU8AyW8MuHJpgwwWayi
 .COCio5YhABxjMOULzOV8LT0PhYN.NPAktXgILrT9iBMm9Mtlp3pHIL7rUtRLv3qfx3CXwZisZAY
 5jZiPcfwPFAx4zao0q9hnGSBbYEDGKIvHkN7ajYIDQXeRcgJJL2CAf4EH7aSrEPoNnSgNR8v1i80
 nle4DtY80relKRM0EUjKHTqbmYUB_Je5Yur9I37aqeJDuj8T1zXjTu.3b0VRXa0PWNCxT_QYKBqb
 wLHWVaytJ2hnQST0oPS3CoPygRDGv8X7cMJIdWyrq_gEHxh875YJD6EhMEwC3FPcGQq_HLOW5eS7
 RVFpI_nPqT.n02EI-
X-Sonic-MF: <adelodunolaoluwa@yahoo.com>
X-Sonic-ID: 4ac6e3db-7a3a-474d-8c06-2bc22d02e131
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.gq1.yahoo.com with HTTP; Fri, 21 Nov 2025 12:43:51 +0000
Received: by hermes--production-bf1-694dc9467b-b55c8 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 79ab57af21456c3aee69f39f13bd65c0;
          Fri, 21 Nov 2025 12:43:47 +0000 (UTC)
From: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Sunday Adelodun <adelodunolaoluwa@yahoo.com>
Subject: [PATCH] most: usb: add missing kernel-doc annotations and fix struct field descriptions
Date: Fri, 21 Nov 2025 13:43:39 +0100
Message-ID: <20251121124339.22657-1-adelodunolaoluwa@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20251121124339.22657-1-adelodunolaoluwa.ref@yahoo.com>

Several structures and functions in most_usb.c were missing kernel-doc
annotations or had incomplete descriptions.
Add the missing parameter and return value documentation and update struct
field descriptions

These changes resolve multiple `kernel-doc` warnings and improve
documentation clarity.

Signed-off-by: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
---
 drivers/most/most_usb.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/most/most_usb.c b/drivers/most/most_usb.c
index 10064d7b7249..b78b49c5747b 100644
--- a/drivers/most/most_usb.c
+++ b/drivers/most/most_usb.c
@@ -58,7 +58,7 @@
 
 /**
  * struct most_dci_obj - Direct Communication Interface
- * @kobj:position in sysfs
+ * @dev: device structure representing the DCI device in sysfs
  * @usb_device: pointer to the usb device
  * @reg_addr: register address for arbitrary DCI access
  */
@@ -83,6 +83,7 @@ struct clear_hold_work {
 
 /**
  * struct most_dev - holds all usb interface specific stuff
+ * @dev: device structure representing the 'most' device
  * @usb_device: pointer to usb device
  * @iface: hardware interface
  * @cap: channel capabilities
@@ -94,10 +95,12 @@ struct clear_hold_work {
  * @channel_lock: synchronize channel access
  * @padding_active: indicates channel uses padding
  * @is_channel_healthy: health status table of each channel
+ * @clear_work: per-channel work items used to clear halts on endpoints
  * @busy_urbs: list of anchored items
  * @io_mutex: synchronize I/O with disconnect
  * @link_stat_timer: timer for link status reports
  * @poll_work_obj: work for polling link status
+ * @on_netinfo: callback invoked when network information is retrieved
  */
 struct most_dev {
 	struct device dev;
@@ -135,6 +138,8 @@ static void wq_netinfo(struct work_struct *wq_obj);
  * @buf: buffer to store data
  *
  * This is reads data from INIC's direct register communication interface
+ *
+ * Return: 0 on success, negative error code on failure
  */
 static inline int drci_rd_reg(struct usb_device *dev, u16 reg, u16 *buf)
 {
@@ -166,6 +171,8 @@ static inline int drci_rd_reg(struct usb_device *dev, u16 reg, u16 *buf)
  * @data: data to write
  *
  * This is writes data to INIC's direct register communication interface
+ *
+ * Return: number of bytes transferred on success or a negative error code
  */
 static inline int drci_wr_reg(struct usb_device *dev, u16 reg, u16 data)
 {
@@ -189,6 +196,8 @@ static inline int start_sync_ep(struct usb_device *usb_dev, u16 ep)
  * get_stream_frame_size - calculate frame size of current configuration
  * @dev: device structure
  * @cfg: channel configuration
+ *
+ * Return: calculated frame size, or 0 on misconfiguration
  */
 static unsigned int get_stream_frame_size(struct device *dev,
 					  struct most_channel_config *cfg)
@@ -231,7 +240,7 @@ static unsigned int get_stream_frame_size(struct device *dev,
  * calls the associated completion function of the core and removes
  * them from the list.
  *
- * Returns 0 on success or error code otherwise.
+ * Returns: 0 on success or error code otherwise.
  */
 static int hdm_poison_channel(struct most_interface *iface, int channel)
 {
@@ -272,6 +281,8 @@ static int hdm_poison_channel(struct most_interface *iface, int channel)
  *
  * This inserts the INIC hardware specific padding bytes into a streaming
  * channel's buffer
+ *
+ * Return: 0 on success, negative errno on failure
  */
 static int hdm_add_padding(struct most_dev *mdev, int channel, struct mbo *mbo)
 {
@@ -305,6 +316,8 @@ static int hdm_add_padding(struct most_dev *mdev, int channel, struct mbo *mbo)
  *
  * This takes the INIC hardware specific padding bytes off a streaming
  * channel's buffer.
+ *
+ * Return: 0 on success, negative errno on failure.
  */
 static int hdm_remove_padding(struct most_dev *mdev, int channel,
 			      struct mbo *mbo)
@@ -449,7 +462,7 @@ static void hdm_read_completion(struct urb *urb)
  * that is being used for transmission of data. Before the URB is
  * submitted it is stored in the private anchor list.
  *
- * Returns 0 on success. On any error the URB is freed and a error code
+ * Returns: 0 on success. On any error the URB is freed and a error code
  * is returned.
  *
  * Context: Could in _some_ cases be interrupt!
@@ -562,6 +575,7 @@ static void hdm_dma_free(struct mbo *mbo, u32 size)
  * the number of bytes it needs to pad when transmitting or to cut off when
  * receiving data.
  *
+ * Return: 0 on success, negative errno on failure.
  */
 static int hdm_configure_channel(struct most_interface *iface, int channel,
 				 struct most_channel_config *conf)
@@ -638,6 +652,7 @@ static int hdm_configure_channel(struct most_interface *iface, int channel,
  * hdm_request_netinfo - request network information
  * @iface: pointer to interface
  * @channel: channel ID
+ * @on_netinfo: callback function to invoke when network information is available
  *
  * This is used as trigger to set up the link status timer that
  * polls for the NI state of the INIC every 2 seconds.
@@ -945,7 +960,7 @@ static void release_mdev(struct device *dev)
  * the interface with the core.
  * Additionally, the DCI objects are created and the hardware is sync'd.
  *
- * Return 0 on success. In case of an error a negative number is returned.
+ * Return: 0 on success. In case of an error a negative number is returned.
  */
 static int
 hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
-- 
2.43.0

