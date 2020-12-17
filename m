Return-Path: <SRS0=+FSu=FV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MIME_HTML_MOSTLY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4053C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 12:38:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 421ED23434
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 12:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 421ED23434
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 875CA87377;
	Thu, 17 Dec 2020 12:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hZuzr_I8W-LD; Thu, 17 Dec 2020 12:38:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5F5E78735C;
	Thu, 17 Dec 2020 12:38:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43E97C0893;
	Thu, 17 Dec 2020 12:38:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34C91C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 12:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1157621503
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 12:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HFh1RnShN4KB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 12:38:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by silver.osuosl.org (Postfix) with ESMTPS id 3C24320BF8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 12:38:47 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id 81so27280619ioc.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 04:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tsn6tDcaNV33O6lvwQgNue7IZnKWT+o8fZxQ8dxf/0M=;
 b=uk/Klf5DvnM4gfbBZXkjrKEM6PtoWONM9XLX6rJ3JBU/5tXrQS/UKY6Q47Zna7OchV
 aPzta0vEVLjlaLxU+c0dloU0qvyRxG4ENEinLcQ0/GN/qcdjemvE/WR0cEuw06R3MECk
 /JzK7iH3CVvQtw1dgTSd5Pd4W+b4Ob8hM/sN5cz4RTwg+gOvGTTc5OKkb2fWS3LAISv9
 MjMeU87HJenY+jKX03DDl/RTgmrvQz7ZTiMfuG8S6RkbuGsXO+ZF7s2vHYy15pn47WUe
 TLa9n31Se5U7K3JnzzFTFRQJebN6FxFGM3rD/kFEap3Tcyv+VkrIi7HouKDb9bpaWkqx
 AZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tsn6tDcaNV33O6lvwQgNue7IZnKWT+o8fZxQ8dxf/0M=;
 b=O4GTbfkpJfqEM2rsJbbPs5/GBiZ/05Rjxroxnn/hmIQccdz4bhPFd25rF3vmjbyxwX
 M8p9k4uNrA2WPgpu1WLPXcBfZV/FVnWr0c8F1HNJ7JO7EL4v/Q42l79T8npBeBMiilgc
 qAvLhbTY+jh/gQDDBm3zinGJ5Wf+63aQ1tZ2J5S+TUdn/Ye4Hooor45DLqAGC7/8JQE5
 O36yszBgXXR/yNT0rWgo5cvywnqK8vVjWFSKW0B0CgpRLntPml9cvh9TqOV4cAiIoiR3
 VHQRPY7VN6ngztmg/asoCdCJK6ojmWygpxgK8kzUXrdQh9KfqxIpR4+LpjYRjs8UA07l
 p/dQ==
X-Gm-Message-State: AOAM530te0yuEvP3MbFQcaFjxbsN2s4vQzfl+i95/jQWQXUDgL16aDKq
 bl6lzEYPuTkOQbfNsxg9IVStC/uaGC3Q1/9TV0M=
X-Google-Smtp-Source: ABdhPJyjOVQT01BcRHRv21K6WPn0qnCQXrrL9b05JprAQ0ZJc3P2BDpn8v8U+Sktwi0l5SD72I3b8yYt2QoxaEinhGI=
X-Received: by 2002:a02:9107:: with SMTP id a7mr21927195jag.12.1608208726299; 
 Thu, 17 Dec 2020 04:38:46 -0800 (PST)
MIME-Version: 1.0
References: <20201217120634.19273-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201217120634.19273-1-dwaipayanray1@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 17 Dec 2020 13:38:41 +0100
Message-ID: <CAKXUXMzEbvv1fmtmijd6miQTm=oq--s_5gQ6QZ-tjh=752yrrA@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] acpi: Use DEVICE_ATTR_<RW|RO|WO>
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
Content-Type: multipart/mixed; boundary="===============6827880178628395632=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6827880178628395632==
Content-Type: multipart/alternative; boundary="000000000000db199105b6a845e4"

--000000000000db199105b6a845e4
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 17, 2020 at 1:06 PM Dwaipayan Ray <dwaipayanray1@gmail.com>
wrote:

> Instead of open coding DEVICE_ATTR(), use the
> DEVICE_ATTR_RW(), DEVICE_ATTR_RO() and DEVICE_ATTR_WO()
> macros wherever possible.
>
> This required a few functions to be renamed but the
> functionality itself is unchanged.
>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
>


Basically looks good. Send it out to the maintainers and await the feedback.

It could be that this does not meet the naming conventions the maintainers
have, but you will see.

It is certainly worth a try and some discussion.

Lukas


> ---
> Note: The patch is compiled tested only.
> Merges cleanly with next-20201210
>
>  drivers/acpi/acpi_pad.c     | 24 ++++++++------------
>  drivers/acpi/acpi_tad.c     | 14 ++++++------
>  drivers/acpi/bgrt.c         | 20 ++++++++---------
>  drivers/acpi/device_sysfs.c | 44 ++++++++++++++++++-------------------
>  drivers/acpi/dock.c         | 26 +++++++++++-----------
>  drivers/acpi/power.c        |  9 ++++----
>  6 files changed, 66 insertions(+), 71 deletions(-)
>
> diff --git a/drivers/acpi/acpi_pad.c b/drivers/acpi/acpi_pad.c
> index b8745ce48a47..b84ab722feb4 100644
> --- a/drivers/acpi/acpi_pad.c
> +++ b/drivers/acpi/acpi_pad.c
> @@ -261,7 +261,7 @@ static uint32_t acpi_pad_idle_cpus_num(void)
>         return ps_tsk_num;
>  }
>
> -static ssize_t acpi_pad_rrtime_store(struct device *dev,
> +static ssize_t rrtime_store(struct device *dev,
>         struct device_attribute *attr, const char *buf, size_t count)
>  {
>         unsigned long num;
> @@ -275,16 +275,14 @@ static ssize_t acpi_pad_rrtime_store(struct device
> *dev,
>         return count;
>  }
>
> -static ssize_t acpi_pad_rrtime_show(struct device *dev,
> +static ssize_t rrtime_show(struct device *dev,
>         struct device_attribute *attr, char *buf)
>  {
>         return scnprintf(buf, PAGE_SIZE, "%d\n", round_robin_time);
>  }
> -static DEVICE_ATTR(rrtime, S_IRUGO|S_IWUSR,
> -       acpi_pad_rrtime_show,
> -       acpi_pad_rrtime_store);
> +static DEVICE_ATTR_RW(rrtime);
>
> -static ssize_t acpi_pad_idlepct_store(struct device *dev,
> +static ssize_t idlepct_store(struct device *dev,
>         struct device_attribute *attr, const char *buf, size_t count)
>  {
>         unsigned long num;
> @@ -298,16 +296,14 @@ static ssize_t acpi_pad_idlepct_store(struct device
> *dev,
>         return count;
>  }
>
> -static ssize_t acpi_pad_idlepct_show(struct device *dev,
> +static ssize_t idlepct_show(struct device *dev,
>         struct device_attribute *attr, char *buf)
>  {
>         return scnprintf(buf, PAGE_SIZE, "%d\n", idle_pct);
>  }
> -static DEVICE_ATTR(idlepct, S_IRUGO|S_IWUSR,
> -       acpi_pad_idlepct_show,
> -       acpi_pad_idlepct_store);
> +static DEVICE_ATTR_RW(idlepct);
>
> -static ssize_t acpi_pad_idlecpus_store(struct device *dev,
> +static ssize_t idlecpus_store(struct device *dev,
>         struct device_attribute *attr, const char *buf, size_t count)
>  {
>         unsigned long num;
> @@ -319,16 +315,14 @@ static ssize_t acpi_pad_idlecpus_store(struct device
> *dev,
>         return count;
>  }
>
> -static ssize_t acpi_pad_idlecpus_show(struct device *dev,
> +static ssize_t idlecpus_show(struct device *dev,
>         struct device_attribute *attr, char *buf)
>  {
>         return cpumap_print_to_pagebuf(false, buf,
>                                        to_cpumask(pad_busy_cpus_bits));
>  }
>
> -static DEVICE_ATTR(idlecpus, S_IRUGO|S_IWUSR,
> -       acpi_pad_idlecpus_show,
> -       acpi_pad_idlecpus_store);
> +static DEVICE_ATTR_RW(idlecpus);
>
>  static int acpi_pad_add_sysfs(struct acpi_device *device)
>  {
> diff --git a/drivers/acpi/acpi_tad.c b/drivers/acpi/acpi_tad.c
> index 7d45cce0c3c1..e9b8e8305e23 100644
> --- a/drivers/acpi/acpi_tad.c
> +++ b/drivers/acpi/acpi_tad.c
> @@ -237,7 +237,7 @@ static ssize_t time_show(struct device *dev, struct
> device_attribute *attr,
>                        rt.tz, rt.daylight);
>  }
>
> -static DEVICE_ATTR(time, S_IRUSR | S_IWUSR, time_show, time_store);
> +static DEVICE_ATTR_RW(time);
>
>  static struct attribute *acpi_tad_time_attrs[] = {
>         &dev_attr_time.attr,
> @@ -446,7 +446,7 @@ static ssize_t ac_alarm_show(struct device *dev,
> struct device_attribute *attr,
>         return acpi_tad_alarm_read(dev, buf, ACPI_TAD_AC_TIMER);
>  }
>
> -static DEVICE_ATTR(ac_alarm, S_IRUSR | S_IWUSR, ac_alarm_show,
> ac_alarm_store);
> +static DEVICE_ATTR_RW(ac_alarm);
>
>  static ssize_t ac_policy_store(struct device *dev, struct
> device_attribute *attr,
>                                const char *buf, size_t count)
> @@ -462,7 +462,7 @@ static ssize_t ac_policy_show(struct device *dev,
> struct device_attribute *attr,
>         return acpi_tad_policy_read(dev, buf, ACPI_TAD_AC_TIMER);
>  }
>
> -static DEVICE_ATTR(ac_policy, S_IRUSR | S_IWUSR, ac_policy_show,
> ac_policy_store);
> +static DEVICE_ATTR_RW(ac_policy);
>
>  static ssize_t ac_status_store(struct device *dev, struct
> device_attribute *attr,
>                                const char *buf, size_t count)
> @@ -478,7 +478,7 @@ static ssize_t ac_status_show(struct device *dev,
> struct device_attribute *attr,
>         return acpi_tad_status_read(dev, buf, ACPI_TAD_AC_TIMER);
>  }
>
> -static DEVICE_ATTR(ac_status, S_IRUSR | S_IWUSR, ac_status_show,
> ac_status_store);
> +static DEVICE_ATTR_RW(ac_status);
>
>  static struct attribute *acpi_tad_attrs[] = {
>         &dev_attr_caps.attr,
> @@ -505,7 +505,7 @@ static ssize_t dc_alarm_show(struct device *dev,
> struct device_attribute *attr,
>         return acpi_tad_alarm_read(dev, buf, ACPI_TAD_DC_TIMER);
>  }
>
> -static DEVICE_ATTR(dc_alarm, S_IRUSR | S_IWUSR, dc_alarm_show,
> dc_alarm_store);
> +static DEVICE_ATTR_RW(dc_alarm);
>
>  static ssize_t dc_policy_store(struct device *dev, struct
> device_attribute *attr,
>                                const char *buf, size_t count)
> @@ -521,7 +521,7 @@ static ssize_t dc_policy_show(struct device *dev,
> struct device_attribute *attr,
>         return acpi_tad_policy_read(dev, buf, ACPI_TAD_DC_TIMER);
>  }
>
> -static DEVICE_ATTR(dc_policy, S_IRUSR | S_IWUSR, dc_policy_show,
> dc_policy_store);
> +static DEVICE_ATTR_RW(dc_policy);
>
>  static ssize_t dc_status_store(struct device *dev, struct
> device_attribute *attr,
>                                const char *buf, size_t count)
> @@ -537,7 +537,7 @@ static ssize_t dc_status_show(struct device *dev,
> struct device_attribute *attr,
>         return acpi_tad_status_read(dev, buf, ACPI_TAD_DC_TIMER);
>  }
>
> -static DEVICE_ATTR(dc_status, S_IRUSR | S_IWUSR, dc_status_show,
> dc_status_store);
> +static DEVICE_ATTR_RW(dc_status);
>
>  static struct attribute *acpi_tad_dc_attrs[] = {
>         &dev_attr_dc_alarm.attr,
> diff --git a/drivers/acpi/bgrt.c b/drivers/acpi/bgrt.c
> index 251f961c28cc..19bb7f870204 100644
> --- a/drivers/acpi/bgrt.c
> +++ b/drivers/acpi/bgrt.c
> @@ -15,40 +15,40 @@
>  static void *bgrt_image;
>  static struct kobject *bgrt_kobj;
>
> -static ssize_t show_version(struct device *dev,
> +static ssize_t version_show(struct device *dev,
>                             struct device_attribute *attr, char *buf)
>  {
>         return snprintf(buf, PAGE_SIZE, "%d\n", bgrt_tab.version);
>  }
> -static DEVICE_ATTR(version, S_IRUGO, show_version, NULL);
> +static DEVICE_ATTR_RO(version);
>
> -static ssize_t show_status(struct device *dev,
> +static ssize_t status_show(struct device *dev,
>                            struct device_attribute *attr, char *buf)
>  {
>         return snprintf(buf, PAGE_SIZE, "%d\n", bgrt_tab.status);
>  }
> -static DEVICE_ATTR(status, S_IRUGO, show_status, NULL);
> +static DEVICE_ATTR_RO(status);
>
> -static ssize_t show_type(struct device *dev,
> +static ssize_t type_show(struct device *dev,
>                          struct device_attribute *attr, char *buf)
>  {
>         return snprintf(buf, PAGE_SIZE, "%d\n", bgrt_tab.image_type);
>  }
> -static DEVICE_ATTR(type, S_IRUGO, show_type, NULL);
> +static DEVICE_ATTR_RO(type);
>
> -static ssize_t show_xoffset(struct device *dev,
> +static ssize_t xoffset_show(struct device *dev,
>                             struct device_attribute *attr, char *buf)
>  {
>         return snprintf(buf, PAGE_SIZE, "%d\n", bgrt_tab.image_offset_x);
>  }
> -static DEVICE_ATTR(xoffset, S_IRUGO, show_xoffset, NULL);
> +static DEVICE_ATTR_RO(xoffset);
>
> -static ssize_t show_yoffset(struct device *dev,
> +static ssize_t yoffset_show(struct device *dev,
>                             struct device_attribute *attr, char *buf)
>  {
>         return snprintf(buf, PAGE_SIZE, "%d\n", bgrt_tab.image_offset_y);
>  }
> -static DEVICE_ATTR(yoffset, S_IRUGO, show_yoffset, NULL);
> +static DEVICE_ATTR_RO(yoffset);
>
>  static ssize_t image_read(struct file *file, struct kobject *kobj,
>                struct bin_attribute *attr, char *buf, loff_t off, size_t
> count)
> diff --git a/drivers/acpi/device_sysfs.c b/drivers/acpi/device_sysfs.c
> index 96869f1538b9..a25f108240e4 100644
> --- a/drivers/acpi/device_sysfs.c
> +++ b/drivers/acpi/device_sysfs.c
> @@ -333,11 +333,11 @@ int acpi_device_modalias(struct device *dev, char
> *buf, int size)
>  EXPORT_SYMBOL_GPL(acpi_device_modalias);
>
>  static ssize_t
> -acpi_device_modalias_show(struct device *dev, struct device_attribute
> *attr, char *buf)
> +modalias_show(struct device *dev, struct device_attribute *attr, char
> *buf)
>  {
>         return __acpi_device_modalias(to_acpi_device(dev), buf, 1024);
>  }
> -static DEVICE_ATTR(modalias, 0444, acpi_device_modalias_show, NULL);
> +static DEVICE_ATTR_RO(modalias);
>
>  static ssize_t real_power_state_show(struct device *dev,
>                                      struct device_attribute *attr, char
> *buf)
> @@ -366,8 +366,8 @@ static ssize_t power_state_show(struct device *dev,
>  static DEVICE_ATTR_RO(power_state);
>
>  static ssize_t
> -acpi_eject_store(struct device *d, struct device_attribute *attr,
> -               const char *buf, size_t count)
> +eject_store(struct device *d, struct device_attribute *attr,
> +           const char *buf, size_t count)
>  {
>         struct acpi_device *acpi_device = to_acpi_device(d);
>         acpi_object_type not_used;
> @@ -395,28 +395,28 @@ acpi_eject_store(struct device *d, struct
> device_attribute *attr,
>         return status == AE_NO_MEMORY ? -ENOMEM : -EAGAIN;
>  }
>
> -static DEVICE_ATTR(eject, 0200, NULL, acpi_eject_store);
> +static DEVICE_ATTR_WO(eject);
>
>  static ssize_t
> -acpi_device_hid_show(struct device *dev, struct device_attribute *attr,
> char *buf)
> +hid_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>         struct acpi_device *acpi_dev = to_acpi_device(dev);
>
>         return sprintf(buf, "%s\n", acpi_device_hid(acpi_dev));
>  }
> -static DEVICE_ATTR(hid, 0444, acpi_device_hid_show, NULL);
> +static DEVICE_ATTR_RO(hid);
>
> -static ssize_t acpi_device_uid_show(struct device *dev,
> -                                   struct device_attribute *attr, char
> *buf)
> +static ssize_t uid_show(struct device *dev,
> +                       struct device_attribute *attr, char *buf)
>  {
>         struct acpi_device *acpi_dev = to_acpi_device(dev);
>
>         return sprintf(buf, "%s\n", acpi_dev->pnp.unique_id);
>  }
> -static DEVICE_ATTR(uid, 0444, acpi_device_uid_show, NULL);
> +static DEVICE_ATTR_RO(uid);
>
> -static ssize_t acpi_device_adr_show(struct device *dev,
> -                                   struct device_attribute *attr, char
> *buf)
> +static ssize_t adr_show(struct device *dev,
> +                       struct device_attribute *attr, char *buf)
>  {
>         struct acpi_device *acpi_dev = to_acpi_device(dev);
>
> @@ -425,16 +425,16 @@ static ssize_t acpi_device_adr_show(struct device
> *dev,
>         else
>                 return sprintf(buf, "0x%08llx\n",
> acpi_dev->pnp.bus_address);
>  }
> -static DEVICE_ATTR(adr, 0444, acpi_device_adr_show, NULL);
> +static DEVICE_ATTR_RO(adr);
>
> -static ssize_t acpi_device_path_show(struct device *dev,
> -                                    struct device_attribute *attr, char
> *buf)
> +static ssize_t path_show(struct device *dev,
> +                        struct device_attribute *attr, char *buf)
>  {
>         struct acpi_device *acpi_dev = to_acpi_device(dev);
>
>         return acpi_object_path(acpi_dev->handle, buf);
>  }
> -static DEVICE_ATTR(path, 0444, acpi_device_path_show, NULL);
> +static DEVICE_ATTR_RO(path);
>
>  /* sysfs file that shows description text from the ACPI _STR method */
>  static ssize_t description_show(struct device *dev,
> @@ -463,8 +463,8 @@ static ssize_t description_show(struct device *dev,
>  static DEVICE_ATTR_RO(description);
>
>  static ssize_t
> -acpi_device_sun_show(struct device *dev, struct device_attribute *attr,
> -                    char *buf) {
> +sun_show(struct device *dev, struct device_attribute *attr,
> +        char *buf) {
>         struct acpi_device *acpi_dev = to_acpi_device(dev);
>         acpi_status status;
>         unsigned long long sun;
> @@ -475,11 +475,11 @@ acpi_device_sun_show(struct device *dev, struct
> device_attribute *attr,
>
>         return sprintf(buf, "%llu\n", sun);
>  }
> -static DEVICE_ATTR(sun, 0444, acpi_device_sun_show, NULL);
> +static DEVICE_ATTR_RO(sun);
>
>  static ssize_t
> -acpi_device_hrv_show(struct device *dev, struct device_attribute *attr,
> -                    char *buf) {
> +hrv_show(struct device *dev, struct device_attribute *attr,
> +        char *buf) {
>         struct acpi_device *acpi_dev = to_acpi_device(dev);
>         acpi_status status;
>         unsigned long long hrv;
> @@ -490,7 +490,7 @@ acpi_device_hrv_show(struct device *dev, struct
> device_attribute *attr,
>
>         return sprintf(buf, "%llu\n", hrv);
>  }
> -static DEVICE_ATTR(hrv, 0444, acpi_device_hrv_show, NULL);
> +static DEVICE_ATTR_RO(hrv);
>
>  static ssize_t status_show(struct device *dev, struct device_attribute
> *attr,
>                                 char *buf) {
> diff --git a/drivers/acpi/dock.c b/drivers/acpi/dock.c
> index 24e076f44d23..0937ceab052e 100644
> --- a/drivers/acpi/dock.c
> +++ b/drivers/acpi/dock.c
> @@ -484,7 +484,7 @@ int dock_notify(struct acpi_device *adev, u32 event)
>  /*
>   * show_docked - read method for "docked" file in sysfs
>   */
> -static ssize_t show_docked(struct device *dev,
> +static ssize_t docked_show(struct device *dev,
>                            struct device_attribute *attr, char *buf)
>  {
>         struct dock_station *dock_station = dev->platform_data;
> @@ -493,25 +493,25 @@ static ssize_t show_docked(struct device *dev,
>         acpi_bus_get_device(dock_station->handle, &adev);
>         return snprintf(buf, PAGE_SIZE, "%u\n",
> acpi_device_enumerated(adev));
>  }
> -static DEVICE_ATTR(docked, S_IRUGO, show_docked, NULL);
> +static DEVICE_ATTR_RO(docked);
>
>  /*
>   * show_flags - read method for flags file in sysfs
>   */
> -static ssize_t show_flags(struct device *dev,
> +static ssize_t flags_show(struct device *dev,
>                           struct device_attribute *attr, char *buf)
>  {
>         struct dock_station *dock_station = dev->platform_data;
>         return snprintf(buf, PAGE_SIZE, "%d\n", dock_station->flags);
>
>  }
> -static DEVICE_ATTR(flags, S_IRUGO, show_flags, NULL);
> +static DEVICE_ATTR_RO(flags);
>
>  /*
>   * write_undock - write method for "undock" file in sysfs
>   */
> -static ssize_t write_undock(struct device *dev, struct device_attribute
> *attr,
> -                          const char *buf, size_t count)
> +static ssize_t undock_store(struct device *dev, struct device_attribute
> *attr,
> +                           const char *buf, size_t count)
>  {
>         int ret;
>         struct dock_station *dock_station = dev->platform_data;
> @@ -525,13 +525,13 @@ static ssize_t write_undock(struct device *dev,
> struct device_attribute *attr,
>         acpi_scan_lock_release();
>         return ret ? ret: count;
>  }
> -static DEVICE_ATTR(undock, S_IWUSR, NULL, write_undock);
> +static DEVICE_ATTR_WO(undock);
>
>  /*
>   * show_dock_uid - read method for "uid" file in sysfs
>   */
> -static ssize_t show_dock_uid(struct device *dev,
> -                            struct device_attribute *attr, char *buf)
> +static ssize_t uid_show(struct device *dev,
> +                       struct device_attribute *attr, char *buf)
>  {
>         unsigned long long lbuf;
>         struct dock_station *dock_station = dev->platform_data;
> @@ -542,10 +542,10 @@ static ssize_t show_dock_uid(struct device *dev,
>
>         return snprintf(buf, PAGE_SIZE, "%llx\n", lbuf);
>  }
> -static DEVICE_ATTR(uid, S_IRUGO, show_dock_uid, NULL);
> +static DEVICE_ATTR_RO(uid);
>
> -static ssize_t show_dock_type(struct device *dev,
> -               struct device_attribute *attr, char *buf)
> +static ssize_t type_show(struct device *dev,
> +                        struct device_attribute *attr, char *buf)
>  {
>         struct dock_station *dock_station = dev->platform_data;
>         char *type;
> @@ -561,7 +561,7 @@ static ssize_t show_dock_type(struct device *dev,
>
>         return snprintf(buf, PAGE_SIZE, "%s\n", type);
>  }
> -static DEVICE_ATTR(type, S_IRUGO, show_dock_type, NULL);
> +static DEVICE_ATTR_RO(type);
>
>  static struct attribute *dock_attributes[] = {
>         &dev_attr_docked.attr,
> diff --git a/drivers/acpi/power.c b/drivers/acpi/power.c
> index 189a0d4c6d06..3a7d0d703059 100644
> --- a/drivers/acpi/power.c
> +++ b/drivers/acpi/power.c
> @@ -886,15 +886,16 @@ static void acpi_release_power_resource(struct
> device *dev)
>         kfree(resource);
>  }
>
> -static ssize_t acpi_power_in_use_show(struct device *dev,
> -                                     struct device_attribute *attr,
> -                                     char *buf) {
> +static ssize_t resource_in_use_show(struct device *dev,
> +                                   struct device_attribute *attr,
> +                                   char *buf)
> +{
>         struct acpi_power_resource *resource;
>
>         resource = to_power_resource(to_acpi_device(dev));
>         return sprintf(buf, "%u\n", !!resource->ref_count);
>  }
> -static DEVICE_ATTR(resource_in_use, 0444, acpi_power_in_use_show, NULL);
> +static DEVICE_ATTR_RO(resource_in_use);
>
>  static void acpi_power_sysfs_remove(struct acpi_device *device)
>  {
> --
> 2.27.0
>
>

--000000000000db199105b6a845e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 1:06 PM Dwaip=
ayan Ray &lt;<a href=3D"mailto:dwaipayanray1@gmail.com">dwaipayanray1@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Instead of open coding DEVICE_ATTR(), use the<br>
DEVICE_ATTR_RW(), DEVICE_ATTR_RO() and DEVICE_ATTR_WO()<br>
macros wherever possible.<br>
<br>
This required a few functions to be renamed but the<br>
functionality itself is unchanged.<br>
<br>
Signed-off-by: Dwaipayan Ray &lt;<a href=3D"mailto:dwaipayanray1@gmail.com"=
 target=3D"_blank">dwaipayanray1@gmail.com</a>&gt;<br></blockquote><div><br=
></div><div><br></div><div>Basically looks good. Send it out to the maintai=
ners and await the feedback.</div><div><br></div><div>It could be that this=
 does not meet the naming conventions the maintainers have, but you will se=
e.</div><div><br></div><div>It is certainly worth a try and some discussion=
.</div><div><br></div><div>Lukas</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
---<br>
Note: The patch is compiled tested only.<br>
Merges cleanly with next-20201210<br>
<br>
=C2=A0drivers/acpi/acpi_pad.c=C2=A0 =C2=A0 =C2=A0| 24 ++++++++------------<=
br>
=C2=A0drivers/acpi/acpi_tad.c=C2=A0 =C2=A0 =C2=A0| 14 ++++++------<br>
=C2=A0drivers/acpi/bgrt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 ++++++++---=
------<br>
=C2=A0drivers/acpi/device_sysfs.c | 44 ++++++++++++++++++------------------=
-<br>
=C2=A0drivers/acpi/dock.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 26 +++++++++++=
-----------<br>
=C2=A0drivers/acpi/power.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 ++++----<br=
>
=C2=A06 files changed, 66 insertions(+), 71 deletions(-)<br>
<br>
diff --git a/drivers/acpi/acpi_pad.c b/drivers/acpi/acpi_pad.c<br>
index b8745ce48a47..b84ab722feb4 100644<br>
--- a/drivers/acpi/acpi_pad.c<br>
+++ b/drivers/acpi/acpi_pad.c<br>
@@ -261,7 +261,7 @@ static uint32_t acpi_pad_idle_cpus_num(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ps_tsk_num;<br>
=C2=A0}<br>
<br>
-static ssize_t acpi_pad_rrtime_store(struct device *dev,<br>
+static ssize_t rrtime_store(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr, const char *buf,=
 size_t count)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long num;<br>
@@ -275,16 +275,14 @@ static ssize_t acpi_pad_rrtime_store(struct device *d=
ev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return count;<br>
=C2=A0}<br>
<br>
-static ssize_t acpi_pad_rrtime_show(struct device *dev,<br>
+static ssize_t rrtime_show(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr, char *buf)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return scnprintf(buf, PAGE_SIZE, &quot;%d\n&quo=
t;, round_robin_time);<br>
=C2=A0}<br>
-static DEVICE_ATTR(rrtime, S_IRUGO|S_IWUSR,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_pad_rrtime_show,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_pad_rrtime_store);<br>
+static DEVICE_ATTR_RW(rrtime);<br>
<br>
-static ssize_t acpi_pad_idlepct_store(struct device *dev,<br>
+static ssize_t idlepct_store(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr, const char *buf,=
 size_t count)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long num;<br>
@@ -298,16 +296,14 @@ static ssize_t acpi_pad_idlepct_store(struct device *=
dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return count;<br>
=C2=A0}<br>
<br>
-static ssize_t acpi_pad_idlepct_show(struct device *dev,<br>
+static ssize_t idlepct_show(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr, char *buf)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return scnprintf(buf, PAGE_SIZE, &quot;%d\n&quo=
t;, idle_pct);<br>
=C2=A0}<br>
-static DEVICE_ATTR(idlepct, S_IRUGO|S_IWUSR,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_pad_idlepct_show,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_pad_idlepct_store);<br>
+static DEVICE_ATTR_RW(idlepct);<br>
<br>
-static ssize_t acpi_pad_idlecpus_store(struct device *dev,<br>
+static ssize_t idlecpus_store(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr, const char *buf,=
 size_t count)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long num;<br>
@@ -319,16 +315,14 @@ static ssize_t acpi_pad_idlecpus_store(struct device =
*dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return count;<br>
=C2=A0}<br>
<br>
-static ssize_t acpi_pad_idlecpus_show(struct device *dev,<br>
+static ssize_t idlecpus_show(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr, char *buf)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return cpumap_print_to_pagebuf(false, buf,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to_cpumas=
k(pad_busy_cpus_bits));<br>
=C2=A0}<br>
<br>
-static DEVICE_ATTR(idlecpus, S_IRUGO|S_IWUSR,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_pad_idlecpus_show,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_pad_idlecpus_store);<br>
+static DEVICE_ATTR_RW(idlecpus);<br>
<br>
=C2=A0static int acpi_pad_add_sysfs(struct acpi_device *device)<br>
=C2=A0{<br>
diff --git a/drivers/acpi/acpi_tad.c b/drivers/acpi/acpi_tad.c<br>
index 7d45cce0c3c1..e9b8e8305e23 100644<br>
--- a/drivers/acpi/acpi_tad.c<br>
+++ b/drivers/acpi/acpi_tad.c<br>
@@ -237,7 +237,7 @@ static ssize_t time_show(struct device *dev, struct dev=
ice_attribute *attr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<a href=3D"http://rt.tz" rel=3D"noreferrer" target=3D"_blank">rt.=
tz</a>, rt.daylight);<br>
=C2=A0}<br>
<br>
-static DEVICE_ATTR(time, S_IRUSR | S_IWUSR, time_show, time_store);<br>
+static DEVICE_ATTR_RW(time);<br>
<br>
=C2=A0static struct attribute *acpi_tad_time_attrs[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;dev_attr_time.attr,<br>
@@ -446,7 +446,7 @@ static ssize_t ac_alarm_show(struct device *dev, struct=
 device_attribute *attr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return acpi_tad_alarm_read(dev, buf, ACPI_TAD_A=
C_TIMER);<br>
=C2=A0}<br>
<br>
-static DEVICE_ATTR(ac_alarm, S_IRUSR | S_IWUSR, ac_alarm_show, ac_alarm_st=
ore);<br>
+static DEVICE_ATTR_RW(ac_alarm);<br>
<br>
=C2=A0static ssize_t ac_policy_store(struct device *dev, struct device_attr=
ibute *attr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t count)<br>
@@ -462,7 +462,7 @@ static ssize_t ac_policy_show(struct device *dev, struc=
t device_attribute *attr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return acpi_tad_policy_read(dev, buf, ACPI_TAD_=
AC_TIMER);<br>
=C2=A0}<br>
<br>
-static DEVICE_ATTR(ac_policy, S_IRUSR | S_IWUSR, ac_policy_show, ac_policy=
_store);<br>
+static DEVICE_ATTR_RW(ac_policy);<br>
<br>
=C2=A0static ssize_t ac_status_store(struct device *dev, struct device_attr=
ibute *attr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t count)<br>
@@ -478,7 +478,7 @@ static ssize_t ac_status_show(struct device *dev, struc=
t device_attribute *attr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return acpi_tad_status_read(dev, buf, ACPI_TAD_=
AC_TIMER);<br>
=C2=A0}<br>
<br>
-static DEVICE_ATTR(ac_status, S_IRUSR | S_IWUSR, ac_status_show, ac_status=
_store);<br>
+static DEVICE_ATTR_RW(ac_status);<br>
<br>
=C2=A0static struct attribute *acpi_tad_attrs[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;dev_attr_caps.attr,<br>
@@ -505,7 +505,7 @@ static ssize_t dc_alarm_show(struct device *dev, struct=
 device_attribute *attr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return acpi_tad_alarm_read(dev, buf, ACPI_TAD_D=
C_TIMER);<br>
=C2=A0}<br>
<br>
-static DEVICE_ATTR(dc_alarm, S_IRUSR | S_IWUSR, dc_alarm_show, dc_alarm_st=
ore);<br>
+static DEVICE_ATTR_RW(dc_alarm);<br>
<br>
=C2=A0static ssize_t dc_policy_store(struct device *dev, struct device_attr=
ibute *attr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t count)<br>
@@ -521,7 +521,7 @@ static ssize_t dc_policy_show(struct device *dev, struc=
t device_attribute *attr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return acpi_tad_policy_read(dev, buf, ACPI_TAD_=
DC_TIMER);<br>
=C2=A0}<br>
<br>
-static DEVICE_ATTR(dc_policy, S_IRUSR | S_IWUSR, dc_policy_show, dc_policy=
_store);<br>
+static DEVICE_ATTR_RW(dc_policy);<br>
<br>
=C2=A0static ssize_t dc_status_store(struct device *dev, struct device_attr=
ibute *attr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t count)<br>
@@ -537,7 +537,7 @@ static ssize_t dc_status_show(struct device *dev, struc=
t device_attribute *attr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return acpi_tad_status_read(dev, buf, ACPI_TAD_=
DC_TIMER);<br>
=C2=A0}<br>
<br>
-static DEVICE_ATTR(dc_status, S_IRUSR | S_IWUSR, dc_status_show, dc_status=
_store);<br>
+static DEVICE_ATTR_RW(dc_status);<br>
<br>
=C2=A0static struct attribute *acpi_tad_dc_attrs[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;dev_attr_dc_alarm.attr,<br>
diff --git a/drivers/acpi/bgrt.c b/drivers/acpi/bgrt.c<br>
index 251f961c28cc..19bb7f870204 100644<br>
--- a/drivers/acpi/bgrt.c<br>
+++ b/drivers/acpi/bgrt.c<br>
@@ -15,40 +15,40 @@<br>
=C2=A0static void *bgrt_image;<br>
=C2=A0static struct kobject *bgrt_kobj;<br>
<br>
-static ssize_t show_version(struct device *dev,<br>
+static ssize_t version_show(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr, char *buf)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return snprintf(buf, PAGE_SIZE, &quot;%d\n&quot=
;, bgrt_tab.version);<br>
=C2=A0}<br>
-static DEVICE_ATTR(version, S_IRUGO, show_version, NULL);<br>
+static DEVICE_ATTR_RO(version);<br>
<br>
-static ssize_t show_status(struct device *dev,<br>
+static ssize_t status_show(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute *attr, char *buf)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return snprintf(buf, PAGE_SIZE, &quot;%d\n&quot=
;, bgrt_tab.status);<br>
=C2=A0}<br>
-static DEVICE_ATTR(status, S_IRUGO, show_status, NULL);<br>
+static DEVICE_ATTR_RO(status);<br>
<br>
-static ssize_t show_type(struct device *dev,<br>
+static ssize_t type_show(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0struct device_attribute *attr, char *buf)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return snprintf(buf, PAGE_SIZE, &quot;%d\n&quot=
;, bgrt_tab.image_type);<br>
=C2=A0}<br>
-static DEVICE_ATTR(type, S_IRUGO, show_type, NULL);<br>
+static DEVICE_ATTR_RO(type);<br>
<br>
-static ssize_t show_xoffset(struct device *dev,<br>
+static ssize_t xoffset_show(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr, char *buf)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return snprintf(buf, PAGE_SIZE, &quot;%d\n&quot=
;, bgrt_tab.image_offset_x);<br>
=C2=A0}<br>
-static DEVICE_ATTR(xoffset, S_IRUGO, show_xoffset, NULL);<br>
+static DEVICE_ATTR_RO(xoffset);<br>
<br>
-static ssize_t show_yoffset(struct device *dev,<br>
+static ssize_t yoffset_show(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr, char *buf)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return snprintf(buf, PAGE_SIZE, &quot;%d\n&quot=
;, bgrt_tab.image_offset_y);<br>
=C2=A0}<br>
-static DEVICE_ATTR(yoffset, S_IRUGO, show_yoffset, NULL);<br>
+static DEVICE_ATTR_RO(yoffset);<br>
<br>
=C2=A0static ssize_t image_read(struct file *file, struct kobject *kobj,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct bin_attribute=
 *attr, char *buf, loff_t off, size_t count)<br>
diff --git a/drivers/acpi/device_sysfs.c b/drivers/acpi/device_sysfs.c<br>
index 96869f1538b9..a25f108240e4 100644<br>
--- a/drivers/acpi/device_sysfs.c<br>
+++ b/drivers/acpi/device_sysfs.c<br>
@@ -333,11 +333,11 @@ int acpi_device_modalias(struct device *dev, char *bu=
f, int size)<br>
=C2=A0EXPORT_SYMBOL_GPL(acpi_device_modalias);<br>
<br>
=C2=A0static ssize_t<br>
-acpi_device_modalias_show(struct device *dev, struct device_attribute *att=
r, char *buf)<br>
+modalias_show(struct device *dev, struct device_attribute *attr, char *buf=
)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return __acpi_device_modalias(to_acpi_device(de=
v), buf, 1024);<br>
=C2=A0}<br>
-static DEVICE_ATTR(modalias, 0444, acpi_device_modalias_show, NULL);<br>
+static DEVICE_ATTR_RO(modalias);<br>
<br>
=C2=A0static ssize_t real_power_state_show(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_at=
tribute *attr, char *buf)<br>
@@ -366,8 +366,8 @@ static ssize_t power_state_show(struct device *dev,<br>
=C2=A0static DEVICE_ATTR_RO(power_state);<br>
<br>
=C2=A0static ssize_t<br>
-acpi_eject_store(struct device *d, struct device_attribute *attr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, si=
ze_t count)<br>
+eject_store(struct device *d, struct device_attribute *attr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t count)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct acpi_device *acpi_device =3D to_acpi_dev=
ice(d);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 acpi_object_type not_used;<br>
@@ -395,28 +395,28 @@ acpi_eject_store(struct device *d, struct device_attr=
ibute *attr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return status =3D=3D AE_NO_MEMORY ? -ENOMEM : -=
EAGAIN;<br>
=C2=A0}<br>
<br>
-static DEVICE_ATTR(eject, 0200, NULL, acpi_eject_store);<br>
+static DEVICE_ATTR_WO(eject);<br>
<br>
=C2=A0static ssize_t<br>
-acpi_device_hid_show(struct device *dev, struct device_attribute *attr, ch=
ar *buf)<br>
+hid_show(struct device *dev, struct device_attribute *attr, char *buf)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct acpi_device *acpi_dev =3D to_acpi_device=
(dev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sprintf(buf, &quot;%s\n&quot;, acpi_devi=
ce_hid(acpi_dev));<br>
=C2=A0}<br>
-static DEVICE_ATTR(hid, 0444, acpi_device_hid_show, NULL);<br>
+static DEVICE_ATTR_RO(hid);<br>
<br>
-static ssize_t acpi_device_uid_show(struct device *dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute=
 *attr, char *buf)<br>
+static ssize_t uid_show(struct device *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0struct device_attribute *attr, char *buf)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct acpi_device *acpi_dev =3D to_acpi_device=
(dev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sprintf(buf, &quot;%s\n&quot;, acpi_dev-=
&gt;pnp.unique_id);<br>
=C2=A0}<br>
-static DEVICE_ATTR(uid, 0444, acpi_device_uid_show, NULL);<br>
+static DEVICE_ATTR_RO(uid);<br>
<br>
-static ssize_t acpi_device_adr_show(struct device *dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute=
 *attr, char *buf)<br>
+static ssize_t adr_show(struct device *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0struct device_attribute *attr, char *buf)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct acpi_device *acpi_dev =3D to_acpi_device=
(dev);<br>
<br>
@@ -425,16 +425,16 @@ static ssize_t acpi_device_adr_show(struct device *de=
v,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return sprintf(buf,=
 &quot;0x%08llx\n&quot;, acpi_dev-&gt;pnp.bus_address);<br>
=C2=A0}<br>
-static DEVICE_ATTR(adr, 0444, acpi_device_adr_show, NULL);<br>
+static DEVICE_ATTR_RO(adr);<br>
<br>
-static ssize_t acpi_device_path_show(struct device *dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribut=
e *attr, char *buf)<br>
+static ssize_t path_show(struct device *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 struct device_attribute *attr, char *buf)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct acpi_device *acpi_dev =3D to_acpi_device=
(dev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return acpi_object_path(acpi_dev-&gt;handle, bu=
f);<br>
=C2=A0}<br>
-static DEVICE_ATTR(path, 0444, acpi_device_path_show, NULL);<br>
+static DEVICE_ATTR_RO(path);<br>
<br>
=C2=A0/* sysfs file that shows description text from the ACPI _STR method *=
/<br>
=C2=A0static ssize_t description_show(struct device *dev,<br>
@@ -463,8 +463,8 @@ static ssize_t description_show(struct device *dev,<br>
=C2=A0static DEVICE_ATTR_RO(description);<br>
<br>
=C2=A0static ssize_t<br>
-acpi_device_sun_show(struct device *dev, struct device_attribute *attr,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char=
 *buf) {<br>
+sun_show(struct device *dev, struct device_attribute *attr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *buf) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct acpi_device *acpi_dev =3D to_acpi_device=
(dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 acpi_status status;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long long sun;<br>
@@ -475,11 +475,11 @@ acpi_device_sun_show(struct device *dev, struct devic=
e_attribute *attr,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sprintf(buf, &quot;%llu\n&quot;, sun);<b=
r>
=C2=A0}<br>
-static DEVICE_ATTR(sun, 0444, acpi_device_sun_show, NULL);<br>
+static DEVICE_ATTR_RO(sun);<br>
<br>
=C2=A0static ssize_t<br>
-acpi_device_hrv_show(struct device *dev, struct device_attribute *attr,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char=
 *buf) {<br>
+hrv_show(struct device *dev, struct device_attribute *attr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *buf) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct acpi_device *acpi_dev =3D to_acpi_device=
(dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 acpi_status status;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long long hrv;<br>
@@ -490,7 +490,7 @@ acpi_device_hrv_show(struct device *dev, struct device_=
attribute *attr,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sprintf(buf, &quot;%llu\n&quot;, hrv);<b=
r>
=C2=A0}<br>
-static DEVICE_ATTR(hrv, 0444, acpi_device_hrv_show, NULL);<br>
+static DEVICE_ATTR_RO(hrv);<br>
<br>
=C2=A0static ssize_t status_show(struct device *dev, struct device_attribut=
e *attr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *buf) {<br>
diff --git a/drivers/acpi/dock.c b/drivers/acpi/dock.c<br>
index 24e076f44d23..0937ceab052e 100644<br>
--- a/drivers/acpi/dock.c<br>
+++ b/drivers/acpi/dock.c<br>
@@ -484,7 +484,7 @@ int dock_notify(struct acpi_device *adev, u32 event)<br=
>
=C2=A0/*<br>
=C2=A0 * show_docked - read method for &quot;docked&quot; file in sysfs<br>
=C2=A0 */<br>
-static ssize_t show_docked(struct device *dev,<br>
+static ssize_t docked_show(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute *attr, char *buf)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dock_station *dock_station =3D dev-&gt;p=
latform_data;<br>
@@ -493,25 +493,25 @@ static ssize_t show_docked(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 acpi_bus_get_device(dock_station-&gt;handle, &a=
mp;adev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return snprintf(buf, PAGE_SIZE, &quot;%u\n&quot=
;, acpi_device_enumerated(adev));<br>
=C2=A0}<br>
-static DEVICE_ATTR(docked, S_IRUGO, show_docked, NULL);<br>
+static DEVICE_ATTR_RO(docked);<br>
<br>
=C2=A0/*<br>
=C2=A0 * show_flags - read method for flags file in sysfs<br>
=C2=A0 */<br>
-static ssize_t show_flags(struct device *dev,<br>
+static ssize_t flags_show(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 struct device_attribute *attr, char *buf)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dock_station *dock_station =3D dev-&gt;p=
latform_data;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return snprintf(buf, PAGE_SIZE, &quot;%d\n&quot=
;, dock_station-&gt;flags);<br>
<br>
=C2=A0}<br>
-static DEVICE_ATTR(flags, S_IRUGO, show_flags, NULL);<br>
+static DEVICE_ATTR_RO(flags);<br>
<br>
=C2=A0/*<br>
=C2=A0 * write_undock - write method for &quot;undock&quot; file in sysfs<b=
r>
=C2=A0 */<br>
-static ssize_t write_undock(struct device *dev, struct device_attribute *a=
ttr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const char *buf, size_t count)<br>
+static ssize_t undock_store(struct device *dev, struct device_attribute *a=
ttr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t count)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dock_station *dock_station =3D dev-&gt;p=
latform_data;<br>
@@ -525,13 +525,13 @@ static ssize_t write_undock(struct device *dev, struc=
t device_attribute *attr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 acpi_scan_lock_release();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret ? ret: count;<br>
=C2=A0}<br>
-static DEVICE_ATTR(undock, S_IWUSR, NULL, write_undock);<br>
+static DEVICE_ATTR_WO(undock);<br>
<br>
=C2=A0/*<br>
=C2=A0 * show_dock_uid - read method for &quot;uid&quot; file in sysfs<br>
=C2=A0 */<br>
-static ssize_t show_dock_uid(struct device *dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr, char *buf)<br>
+static ssize_t uid_show(struct device *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0struct device_attribute *attr, char *buf)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long long lbuf;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dock_station *dock_station =3D dev-&gt;p=
latform_data;<br>
@@ -542,10 +542,10 @@ static ssize_t show_dock_uid(struct device *dev,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return snprintf(buf, PAGE_SIZE, &quot;%llx\n&qu=
ot;, lbuf);<br>
=C2=A0}<br>
-static DEVICE_ATTR(uid, S_IRUGO, show_dock_uid, NULL);<br>
+static DEVICE_ATTR_RO(uid);<br>
<br>
-static ssize_t show_dock_type(struct device *dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attri=
bute *attr, char *buf)<br>
+static ssize_t type_show(struct device *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 struct device_attribute *attr, char *buf)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dock_station *dock_station =3D dev-&gt;p=
latform_data;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *type;<br>
@@ -561,7 +561,7 @@ static ssize_t show_dock_type(struct device *dev,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return snprintf(buf, PAGE_SIZE, &quot;%s\n&quot=
;, type);<br>
=C2=A0}<br>
-static DEVICE_ATTR(type, S_IRUGO, show_dock_type, NULL);<br>
+static DEVICE_ATTR_RO(type);<br>
<br>
=C2=A0static struct attribute *dock_attributes[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;dev_attr_docked.attr,<br>
diff --git a/drivers/acpi/power.c b/drivers/acpi/power.c<br>
index 189a0d4c6d06..3a7d0d703059 100644<br>
--- a/drivers/acpi/power.c<br>
+++ b/drivers/acpi/power.c<br>
@@ -886,15 +886,16 @@ static void acpi_release_power_resource(struct device=
 *dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(resource);<br>
=C2=A0}<br>
<br>
-static ssize_t acpi_power_in_use_show(struct device *dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_at=
tribute *attr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf) {<br>
+static ssize_t resource_in_use_show(struct device *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute=
 *attr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf)<br>
+{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct acpi_power_resource *resource;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 resource =3D to_power_resource(to_acpi_device(d=
ev));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sprintf(buf, &quot;%u\n&quot;, !!resourc=
e-&gt;ref_count);<br>
=C2=A0}<br>
-static DEVICE_ATTR(resource_in_use, 0444, acpi_power_in_use_show, NULL);<b=
r>
+static DEVICE_ATTR_RO(resource_in_use);<br>
<br>
=C2=A0static void acpi_power_sysfs_remove(struct acpi_device *device)<br>
=C2=A0{<br>
-- <br>
2.27.0<br>
<br>
</blockquote></div></div>

--000000000000db199105b6a845e4--

--===============6827880178628395632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6827880178628395632==--

