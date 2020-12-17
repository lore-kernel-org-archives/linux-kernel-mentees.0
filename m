Return-Path: <SRS0=+FSu=FV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39811C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 12:07:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4A70238E8
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 12:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4A70238E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 266D2877DF;
	Thu, 17 Dec 2020 12:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OnQUx2XT5t0h; Thu, 17 Dec 2020 12:07:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 03038877DC;
	Thu, 17 Dec 2020 12:06:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA77BC088E;
	Thu, 17 Dec 2020 12:06:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B949DC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 12:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A9F9787836
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 12:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TzBiWGfJwLvV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 12:06:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4AE3387834
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 12:06:57 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id s2so15027602plr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 04:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJw32OViGhYzI4KhzNIOfurx1I0iN2Y3gN6zsMA0QS0=;
 b=nAuAKDrEzB6P8nPhdrarpikPbuBxCInGOh2iBrQXuoO6Zd7Ph0HUsa5BuEH43bhniN
 5FCGWlGpM71+qLEziG7m+xzQAuG4a3dB17mWR2sF+qRIX1oLhaAg24DzBUy+hS0l0zsC
 yeKZNHORSusQ0fM//7IS1oVZlF0HQlNPiqWzqeVHbdr4SmC7pPOQWkpdALp0E7cJbPYo
 Nji9BYmu3AfZUOfLwmITffZ+vorR0uIx7v92YVDLGERn7OOcE0YiogPavFS2ye3tRCIx
 KQkVW1HoL1XJ+yRJ563UF7b5421FCrU4IWbo6NPlmqge777wv4fGXm3aB6TpQxUEXwzd
 vraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJw32OViGhYzI4KhzNIOfurx1I0iN2Y3gN6zsMA0QS0=;
 b=kvwbX6uMCn5D6jPo//JJWQhK32f+8CTJchJcBENbcYKBkR7Hs3oXCb9VBn6/EEPAM9
 1KzKRVrxj1Qm7alm6dTewISplCDnRu/wnZuNNjeKvRH+MTstIy+oE5X8vL74B86RblyX
 proEfmB2/Hh5bugDGTCGy0EwkguEXgDYXodviiPfF11JGsCMw2bOzkM7GSr9TWfQFtN2
 Ffvw0H0UCVMo8gNK8wD8KyhxU/55iomWwHgPhBKaMHliaX3Yh4duV1lL4jqTgcYUV7QL
 q2uswI5ftPGB/h1oGpOL7d/PjErAdbWD3KegLWRKm30zZTw0UmjR/vjaR+s7YoguTX4w
 AvcQ==
X-Gm-Message-State: AOAM533Hj9Pp7uBSJjiINPClPas+TAGVaIRfcbKGF7SAr+5bVAJXY/ha
 5ndlm7keGUWelrFqRL/EeLk=
X-Google-Smtp-Source: ABdhPJw9fiCDz6NRy0pS8wJOfTs5L6XJpZ5oUUmGI3yU6s2ICYRvIZzL0mvq2sKrgiVHyMmWZNusrA==
X-Received: by 2002:a17:90a:7149:: with SMTP id
 g9mr7693175pjs.12.1608206816657; 
 Thu, 17 Dec 2020 04:06:56 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6023:858f:fc0a:73ba:a8b4])
 by smtp.gmail.com with ESMTPSA id j8sm4942187pji.1.2020.12.17.04.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 04:06:55 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Thu, 17 Dec 2020 17:36:34 +0530
Message-Id: <20201217120634.19273-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] acpi: Use DEVICE_ATTR_<RW|RO|WO>
	macros
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Instead of open coding DEVICE_ATTR(), use the
DEVICE_ATTR_RW(), DEVICE_ATTR_RO() and DEVICE_ATTR_WO()
macros wherever possible.

This required a few functions to be renamed but the
functionality itself is unchanged.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
Note: The patch is compiled tested only.
Merges cleanly with next-20201210

 drivers/acpi/acpi_pad.c     | 24 ++++++++------------
 drivers/acpi/acpi_tad.c     | 14 ++++++------
 drivers/acpi/bgrt.c         | 20 ++++++++---------
 drivers/acpi/device_sysfs.c | 44 ++++++++++++++++++-------------------
 drivers/acpi/dock.c         | 26 +++++++++++-----------
 drivers/acpi/power.c        |  9 ++++----
 6 files changed, 66 insertions(+), 71 deletions(-)

diff --git a/drivers/acpi/acpi_pad.c b/drivers/acpi/acpi_pad.c
index b8745ce48a47..b84ab722feb4 100644
--- a/drivers/acpi/acpi_pad.c
+++ b/drivers/acpi/acpi_pad.c
@@ -261,7 +261,7 @@ static uint32_t acpi_pad_idle_cpus_num(void)
 	return ps_tsk_num;
 }
 
-static ssize_t acpi_pad_rrtime_store(struct device *dev,
+static ssize_t rrtime_store(struct device *dev,
 	struct device_attribute *attr, const char *buf, size_t count)
 {
 	unsigned long num;
@@ -275,16 +275,14 @@ static ssize_t acpi_pad_rrtime_store(struct device *dev,
 	return count;
 }
 
-static ssize_t acpi_pad_rrtime_show(struct device *dev,
+static ssize_t rrtime_show(struct device *dev,
 	struct device_attribute *attr, char *buf)
 {
 	return scnprintf(buf, PAGE_SIZE, "%d\n", round_robin_time);
 }
-static DEVICE_ATTR(rrtime, S_IRUGO|S_IWUSR,
-	acpi_pad_rrtime_show,
-	acpi_pad_rrtime_store);
+static DEVICE_ATTR_RW(rrtime);
 
-static ssize_t acpi_pad_idlepct_store(struct device *dev,
+static ssize_t idlepct_store(struct device *dev,
 	struct device_attribute *attr, const char *buf, size_t count)
 {
 	unsigned long num;
@@ -298,16 +296,14 @@ static ssize_t acpi_pad_idlepct_store(struct device *dev,
 	return count;
 }
 
-static ssize_t acpi_pad_idlepct_show(struct device *dev,
+static ssize_t idlepct_show(struct device *dev,
 	struct device_attribute *attr, char *buf)
 {
 	return scnprintf(buf, PAGE_SIZE, "%d\n", idle_pct);
 }
-static DEVICE_ATTR(idlepct, S_IRUGO|S_IWUSR,
-	acpi_pad_idlepct_show,
-	acpi_pad_idlepct_store);
+static DEVICE_ATTR_RW(idlepct);
 
-static ssize_t acpi_pad_idlecpus_store(struct device *dev,
+static ssize_t idlecpus_store(struct device *dev,
 	struct device_attribute *attr, const char *buf, size_t count)
 {
 	unsigned long num;
@@ -319,16 +315,14 @@ static ssize_t acpi_pad_idlecpus_store(struct device *dev,
 	return count;
 }
 
-static ssize_t acpi_pad_idlecpus_show(struct device *dev,
+static ssize_t idlecpus_show(struct device *dev,
 	struct device_attribute *attr, char *buf)
 {
 	return cpumap_print_to_pagebuf(false, buf,
 				       to_cpumask(pad_busy_cpus_bits));
 }
 
-static DEVICE_ATTR(idlecpus, S_IRUGO|S_IWUSR,
-	acpi_pad_idlecpus_show,
-	acpi_pad_idlecpus_store);
+static DEVICE_ATTR_RW(idlecpus);
 
 static int acpi_pad_add_sysfs(struct acpi_device *device)
 {
diff --git a/drivers/acpi/acpi_tad.c b/drivers/acpi/acpi_tad.c
index 7d45cce0c3c1..e9b8e8305e23 100644
--- a/drivers/acpi/acpi_tad.c
+++ b/drivers/acpi/acpi_tad.c
@@ -237,7 +237,7 @@ static ssize_t time_show(struct device *dev, struct device_attribute *attr,
 		       rt.tz, rt.daylight);
 }
 
-static DEVICE_ATTR(time, S_IRUSR | S_IWUSR, time_show, time_store);
+static DEVICE_ATTR_RW(time);
 
 static struct attribute *acpi_tad_time_attrs[] = {
 	&dev_attr_time.attr,
@@ -446,7 +446,7 @@ static ssize_t ac_alarm_show(struct device *dev, struct device_attribute *attr,
 	return acpi_tad_alarm_read(dev, buf, ACPI_TAD_AC_TIMER);
 }
 
-static DEVICE_ATTR(ac_alarm, S_IRUSR | S_IWUSR, ac_alarm_show, ac_alarm_store);
+static DEVICE_ATTR_RW(ac_alarm);
 
 static ssize_t ac_policy_store(struct device *dev, struct device_attribute *attr,
 			       const char *buf, size_t count)
@@ -462,7 +462,7 @@ static ssize_t ac_policy_show(struct device *dev, struct device_attribute *attr,
 	return acpi_tad_policy_read(dev, buf, ACPI_TAD_AC_TIMER);
 }
 
-static DEVICE_ATTR(ac_policy, S_IRUSR | S_IWUSR, ac_policy_show, ac_policy_store);
+static DEVICE_ATTR_RW(ac_policy);
 
 static ssize_t ac_status_store(struct device *dev, struct device_attribute *attr,
 			       const char *buf, size_t count)
@@ -478,7 +478,7 @@ static ssize_t ac_status_show(struct device *dev, struct device_attribute *attr,
 	return acpi_tad_status_read(dev, buf, ACPI_TAD_AC_TIMER);
 }
 
-static DEVICE_ATTR(ac_status, S_IRUSR | S_IWUSR, ac_status_show, ac_status_store);
+static DEVICE_ATTR_RW(ac_status);
 
 static struct attribute *acpi_tad_attrs[] = {
 	&dev_attr_caps.attr,
@@ -505,7 +505,7 @@ static ssize_t dc_alarm_show(struct device *dev, struct device_attribute *attr,
 	return acpi_tad_alarm_read(dev, buf, ACPI_TAD_DC_TIMER);
 }
 
-static DEVICE_ATTR(dc_alarm, S_IRUSR | S_IWUSR, dc_alarm_show, dc_alarm_store);
+static DEVICE_ATTR_RW(dc_alarm);
 
 static ssize_t dc_policy_store(struct device *dev, struct device_attribute *attr,
 			       const char *buf, size_t count)
@@ -521,7 +521,7 @@ static ssize_t dc_policy_show(struct device *dev, struct device_attribute *attr,
 	return acpi_tad_policy_read(dev, buf, ACPI_TAD_DC_TIMER);
 }
 
-static DEVICE_ATTR(dc_policy, S_IRUSR | S_IWUSR, dc_policy_show, dc_policy_store);
+static DEVICE_ATTR_RW(dc_policy);
 
 static ssize_t dc_status_store(struct device *dev, struct device_attribute *attr,
 			       const char *buf, size_t count)
@@ -537,7 +537,7 @@ static ssize_t dc_status_show(struct device *dev, struct device_attribute *attr,
 	return acpi_tad_status_read(dev, buf, ACPI_TAD_DC_TIMER);
 }
 
-static DEVICE_ATTR(dc_status, S_IRUSR | S_IWUSR, dc_status_show, dc_status_store);
+static DEVICE_ATTR_RW(dc_status);
 
 static struct attribute *acpi_tad_dc_attrs[] = {
 	&dev_attr_dc_alarm.attr,
diff --git a/drivers/acpi/bgrt.c b/drivers/acpi/bgrt.c
index 251f961c28cc..19bb7f870204 100644
--- a/drivers/acpi/bgrt.c
+++ b/drivers/acpi/bgrt.c
@@ -15,40 +15,40 @@
 static void *bgrt_image;
 static struct kobject *bgrt_kobj;
 
-static ssize_t show_version(struct device *dev,
+static ssize_t version_show(struct device *dev,
 			    struct device_attribute *attr, char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%d\n", bgrt_tab.version);
 }
-static DEVICE_ATTR(version, S_IRUGO, show_version, NULL);
+static DEVICE_ATTR_RO(version);
 
-static ssize_t show_status(struct device *dev,
+static ssize_t status_show(struct device *dev,
 			   struct device_attribute *attr, char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%d\n", bgrt_tab.status);
 }
-static DEVICE_ATTR(status, S_IRUGO, show_status, NULL);
+static DEVICE_ATTR_RO(status);
 
-static ssize_t show_type(struct device *dev,
+static ssize_t type_show(struct device *dev,
 			 struct device_attribute *attr, char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%d\n", bgrt_tab.image_type);
 }
-static DEVICE_ATTR(type, S_IRUGO, show_type, NULL);
+static DEVICE_ATTR_RO(type);
 
-static ssize_t show_xoffset(struct device *dev,
+static ssize_t xoffset_show(struct device *dev,
 			    struct device_attribute *attr, char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%d\n", bgrt_tab.image_offset_x);
 }
-static DEVICE_ATTR(xoffset, S_IRUGO, show_xoffset, NULL);
+static DEVICE_ATTR_RO(xoffset);
 
-static ssize_t show_yoffset(struct device *dev,
+static ssize_t yoffset_show(struct device *dev,
 			    struct device_attribute *attr, char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%d\n", bgrt_tab.image_offset_y);
 }
-static DEVICE_ATTR(yoffset, S_IRUGO, show_yoffset, NULL);
+static DEVICE_ATTR_RO(yoffset);
 
 static ssize_t image_read(struct file *file, struct kobject *kobj,
 	       struct bin_attribute *attr, char *buf, loff_t off, size_t count)
diff --git a/drivers/acpi/device_sysfs.c b/drivers/acpi/device_sysfs.c
index 96869f1538b9..a25f108240e4 100644
--- a/drivers/acpi/device_sysfs.c
+++ b/drivers/acpi/device_sysfs.c
@@ -333,11 +333,11 @@ int acpi_device_modalias(struct device *dev, char *buf, int size)
 EXPORT_SYMBOL_GPL(acpi_device_modalias);
 
 static ssize_t
-acpi_device_modalias_show(struct device *dev, struct device_attribute *attr, char *buf)
+modalias_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	return __acpi_device_modalias(to_acpi_device(dev), buf, 1024);
 }
-static DEVICE_ATTR(modalias, 0444, acpi_device_modalias_show, NULL);
+static DEVICE_ATTR_RO(modalias);
 
 static ssize_t real_power_state_show(struct device *dev,
 				     struct device_attribute *attr, char *buf)
@@ -366,8 +366,8 @@ static ssize_t power_state_show(struct device *dev,
 static DEVICE_ATTR_RO(power_state);
 
 static ssize_t
-acpi_eject_store(struct device *d, struct device_attribute *attr,
-		const char *buf, size_t count)
+eject_store(struct device *d, struct device_attribute *attr,
+	    const char *buf, size_t count)
 {
 	struct acpi_device *acpi_device = to_acpi_device(d);
 	acpi_object_type not_used;
@@ -395,28 +395,28 @@ acpi_eject_store(struct device *d, struct device_attribute *attr,
 	return status == AE_NO_MEMORY ? -ENOMEM : -EAGAIN;
 }
 
-static DEVICE_ATTR(eject, 0200, NULL, acpi_eject_store);
+static DEVICE_ATTR_WO(eject);
 
 static ssize_t
-acpi_device_hid_show(struct device *dev, struct device_attribute *attr, char *buf)
+hid_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct acpi_device *acpi_dev = to_acpi_device(dev);
 
 	return sprintf(buf, "%s\n", acpi_device_hid(acpi_dev));
 }
-static DEVICE_ATTR(hid, 0444, acpi_device_hid_show, NULL);
+static DEVICE_ATTR_RO(hid);
 
-static ssize_t acpi_device_uid_show(struct device *dev,
-				    struct device_attribute *attr, char *buf)
+static ssize_t uid_show(struct device *dev,
+			struct device_attribute *attr, char *buf)
 {
 	struct acpi_device *acpi_dev = to_acpi_device(dev);
 
 	return sprintf(buf, "%s\n", acpi_dev->pnp.unique_id);
 }
-static DEVICE_ATTR(uid, 0444, acpi_device_uid_show, NULL);
+static DEVICE_ATTR_RO(uid);
 
-static ssize_t acpi_device_adr_show(struct device *dev,
-				    struct device_attribute *attr, char *buf)
+static ssize_t adr_show(struct device *dev,
+			struct device_attribute *attr, char *buf)
 {
 	struct acpi_device *acpi_dev = to_acpi_device(dev);
 
@@ -425,16 +425,16 @@ static ssize_t acpi_device_adr_show(struct device *dev,
 	else
 		return sprintf(buf, "0x%08llx\n", acpi_dev->pnp.bus_address);
 }
-static DEVICE_ATTR(adr, 0444, acpi_device_adr_show, NULL);
+static DEVICE_ATTR_RO(adr);
 
-static ssize_t acpi_device_path_show(struct device *dev,
-				     struct device_attribute *attr, char *buf)
+static ssize_t path_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
 {
 	struct acpi_device *acpi_dev = to_acpi_device(dev);
 
 	return acpi_object_path(acpi_dev->handle, buf);
 }
-static DEVICE_ATTR(path, 0444, acpi_device_path_show, NULL);
+static DEVICE_ATTR_RO(path);
 
 /* sysfs file that shows description text from the ACPI _STR method */
 static ssize_t description_show(struct device *dev,
@@ -463,8 +463,8 @@ static ssize_t description_show(struct device *dev,
 static DEVICE_ATTR_RO(description);
 
 static ssize_t
-acpi_device_sun_show(struct device *dev, struct device_attribute *attr,
-		     char *buf) {
+sun_show(struct device *dev, struct device_attribute *attr,
+	 char *buf) {
 	struct acpi_device *acpi_dev = to_acpi_device(dev);
 	acpi_status status;
 	unsigned long long sun;
@@ -475,11 +475,11 @@ acpi_device_sun_show(struct device *dev, struct device_attribute *attr,
 
 	return sprintf(buf, "%llu\n", sun);
 }
-static DEVICE_ATTR(sun, 0444, acpi_device_sun_show, NULL);
+static DEVICE_ATTR_RO(sun);
 
 static ssize_t
-acpi_device_hrv_show(struct device *dev, struct device_attribute *attr,
-		     char *buf) {
+hrv_show(struct device *dev, struct device_attribute *attr,
+	 char *buf) {
 	struct acpi_device *acpi_dev = to_acpi_device(dev);
 	acpi_status status;
 	unsigned long long hrv;
@@ -490,7 +490,7 @@ acpi_device_hrv_show(struct device *dev, struct device_attribute *attr,
 
 	return sprintf(buf, "%llu\n", hrv);
 }
-static DEVICE_ATTR(hrv, 0444, acpi_device_hrv_show, NULL);
+static DEVICE_ATTR_RO(hrv);
 
 static ssize_t status_show(struct device *dev, struct device_attribute *attr,
 				char *buf) {
diff --git a/drivers/acpi/dock.c b/drivers/acpi/dock.c
index 24e076f44d23..0937ceab052e 100644
--- a/drivers/acpi/dock.c
+++ b/drivers/acpi/dock.c
@@ -484,7 +484,7 @@ int dock_notify(struct acpi_device *adev, u32 event)
 /*
  * show_docked - read method for "docked" file in sysfs
  */
-static ssize_t show_docked(struct device *dev,
+static ssize_t docked_show(struct device *dev,
 			   struct device_attribute *attr, char *buf)
 {
 	struct dock_station *dock_station = dev->platform_data;
@@ -493,25 +493,25 @@ static ssize_t show_docked(struct device *dev,
 	acpi_bus_get_device(dock_station->handle, &adev);
 	return snprintf(buf, PAGE_SIZE, "%u\n", acpi_device_enumerated(adev));
 }
-static DEVICE_ATTR(docked, S_IRUGO, show_docked, NULL);
+static DEVICE_ATTR_RO(docked);
 
 /*
  * show_flags - read method for flags file in sysfs
  */
-static ssize_t show_flags(struct device *dev,
+static ssize_t flags_show(struct device *dev,
 			  struct device_attribute *attr, char *buf)
 {
 	struct dock_station *dock_station = dev->platform_data;
 	return snprintf(buf, PAGE_SIZE, "%d\n", dock_station->flags);
 
 }
-static DEVICE_ATTR(flags, S_IRUGO, show_flags, NULL);
+static DEVICE_ATTR_RO(flags);
 
 /*
  * write_undock - write method for "undock" file in sysfs
  */
-static ssize_t write_undock(struct device *dev, struct device_attribute *attr,
-			   const char *buf, size_t count)
+static ssize_t undock_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
 {
 	int ret;
 	struct dock_station *dock_station = dev->platform_data;
@@ -525,13 +525,13 @@ static ssize_t write_undock(struct device *dev, struct device_attribute *attr,
 	acpi_scan_lock_release();
 	return ret ? ret: count;
 }
-static DEVICE_ATTR(undock, S_IWUSR, NULL, write_undock);
+static DEVICE_ATTR_WO(undock);
 
 /*
  * show_dock_uid - read method for "uid" file in sysfs
  */
-static ssize_t show_dock_uid(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t uid_show(struct device *dev,
+			struct device_attribute *attr, char *buf)
 {
 	unsigned long long lbuf;
 	struct dock_station *dock_station = dev->platform_data;
@@ -542,10 +542,10 @@ static ssize_t show_dock_uid(struct device *dev,
 
 	return snprintf(buf, PAGE_SIZE, "%llx\n", lbuf);
 }
-static DEVICE_ATTR(uid, S_IRUGO, show_dock_uid, NULL);
+static DEVICE_ATTR_RO(uid);
 
-static ssize_t show_dock_type(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t type_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
 {
 	struct dock_station *dock_station = dev->platform_data;
 	char *type;
@@ -561,7 +561,7 @@ static ssize_t show_dock_type(struct device *dev,
 
 	return snprintf(buf, PAGE_SIZE, "%s\n", type);
 }
-static DEVICE_ATTR(type, S_IRUGO, show_dock_type, NULL);
+static DEVICE_ATTR_RO(type);
 
 static struct attribute *dock_attributes[] = {
 	&dev_attr_docked.attr,
diff --git a/drivers/acpi/power.c b/drivers/acpi/power.c
index 189a0d4c6d06..3a7d0d703059 100644
--- a/drivers/acpi/power.c
+++ b/drivers/acpi/power.c
@@ -886,15 +886,16 @@ static void acpi_release_power_resource(struct device *dev)
 	kfree(resource);
 }
 
-static ssize_t acpi_power_in_use_show(struct device *dev,
-				      struct device_attribute *attr,
-				      char *buf) {
+static ssize_t resource_in_use_show(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
 	struct acpi_power_resource *resource;
 
 	resource = to_power_resource(to_acpi_device(dev));
 	return sprintf(buf, "%u\n", !!resource->ref_count);
 }
-static DEVICE_ATTR(resource_in_use, 0444, acpi_power_in_use_show, NULL);
+static DEVICE_ATTR_RO(resource_in_use);
 
 static void acpi_power_sysfs_remove(struct acpi_device *device)
 {
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
