Return-Path: <SRS0=B2kz=FR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A4EC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Dec 2020 08:01:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30CC022D6F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Dec 2020 08:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30CC022D6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B43D3873CA;
	Sun, 13 Dec 2020 08:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SSbDr702WCjz; Sun, 13 Dec 2020 08:01:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 64A29873BF;
	Sun, 13 Dec 2020 08:01:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53123C0FA7;
	Sun, 13 Dec 2020 08:01:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5EC5C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 08:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C387085FDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 08:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HerQcIBR48mP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 08:01:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1B7CA85FDE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 08:01:00 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id g1so12916917ilk.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 00:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SptOwLmCUuWK4mUudyEVRWCBB5pTnk1I3n0w36lMi9g=;
 b=uuEYFa6HoV28cwjfy5wFMvdsb0auwEzNdOTfRNQhZJ90roavKRziOOCSwLwiQJu6tF
 A9Zhh4VJ3NNtE0ab0btNe9fsBBQZwDpiQBpwmq1+PSd2ty9m/8rgdUlkxEh1I6Xp3awX
 KZ6pijACs/pkePCxpfd+sjo4TnixiKvQRClnEpf2t8X5StHp09S80+D/QMMrxZWOdkWJ
 nOWveoYQY73DVsdNLBaDc4RkgknDJ5jIaaTbsffNoL9FuXdfndHny5EXHgevuJF/GL/q
 ynQc83cO8hvOVR2WMozjtJ+MNl46buen3zY9s39dkJGtldP/X4CRswUA4pqP35PFPqzD
 CqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SptOwLmCUuWK4mUudyEVRWCBB5pTnk1I3n0w36lMi9g=;
 b=LDfSyb2b1c0087n40/VpM0prb2hS00D1vJ4/N/QKVyrA8/Jd838yf8qB9n5ZL296xx
 3iWPhXtKCKAza7ejE7UueIAuo2ehOyAKIEgPZIXhmeRi4ZbY0+wdVh2Ig2G9DMBXxaUR
 Mn1k2ppcsXkToPfd8J8UPW6bLS49QhiS9tdJHiMdiUCMU5K6G7S5Qhqw5ll6FMLVplwq
 YyBAG6Vo8tVAQ6324bgUfdFCItMDcrrZvK1D1IA6eBH0we1C9W+bJH87aM1duDbtj5Yg
 0hX54k9kX9+G+J7+xIVGSUGcAkjCgZXyhP8aXOdCN1pmufVT1dIfMZ7MlHEaazhaFUOL
 +qSA==
X-Gm-Message-State: AOAM533uAhdfP+bU4VQzyhDHYnyXBBQ4t8B2tIkBOB672vco81JLvZUy
 u4MRGpSwajnAFef24EwxOSWOr0HLT1CH3go1JDM=
X-Google-Smtp-Source: ABdhPJyri/5+Z8dIb+Y+i2EW/Gy7oOaTCtvTml3CVnDQJMIsTYkZyUIBcvLiU7D5NAXn4eXaKtBsQsCIU6sAPe/KW+c=
X-Received: by 2002:a92:8587:: with SMTP id
 f129mr26921257ilh.251.1607846459335; 
 Sun, 13 Dec 2020 00:00:59 -0800 (PST)
MIME-Version: 1.0
References: <20201212195548.231494-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201212195548.231494-1-dwaipayanray1@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 13 Dec 2020 09:00:48 +0100
Message-ID: <CAKXUXMx9EnhWhGAJf4ousAgkxDUrN=g2zGaPEk6ijJYse7VJaQ@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-leds@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] leds: Use DEVICE_ATTR_{RW, RO,
	WO} macros
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

On Sat, Dec 12, 2020 at 8:56 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Instead of open coding DEVICE_ATTR() defines, use the
> DEVICE_ATTR_RW(), DEVICE_ATTR_WO(), and DEVICE_ATTR_RO()
> macros intead.

typo: s/intead/instead/

No need to use the word "instead" twice in one sentence, though, we got it :)

>
> This required a few functions to be renamed, but the functionality
> itself is unchanged.
>
> Note that this is compile tested only.
>

This note does not go in the commit message. In the future, this will
be simply not true anymore, but this below the "---" (see HERE! as
marker).

For testing, you can generate the objdump of the binary before and
after and compare if that is as expected.

Other than that, the change itself looks good to me, so:

Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Thanks, Dwaipayan, for fixing this up.

Will you also add a checkpatch rule to identify other DEVICE_ATTR(...)
that can be adjusted to the refined macros, so that checkpatch informs
other submitters as well?

> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Cc: linux-leds@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-kernel-mentees@lists.linuxfoundation.org

As far as I know, the maintainers will add the Cc lines---if they like
those---with script support.

> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---

HERE!

>  drivers/leds/leds-blinkm.c        | 24 ++++++++++++------------
>  drivers/leds/leds-lm3530.c        | 10 +++++-----
>  drivers/leds/leds-lm355x.c        |  8 ++++----
>  drivers/leds/leds-lm3642.c        | 16 ++++++++--------
>  drivers/leds/leds-max8997.c       | 12 ++++++------
>  drivers/leds/leds-netxbig.c       | 12 ++++++------
>  drivers/leds/leds-ss4200.c        | 12 ++++++------
>  drivers/leds/leds-wm831x-status.c | 12 ++++++------
>  8 files changed, 53 insertions(+), 53 deletions(-)
>
> diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
> index e11fe1788242..b4e1fdff4186 100644
> --- a/drivers/leds/leds-blinkm.c
> +++ b/drivers/leds/leds-blinkm.c
> @@ -192,13 +192,13 @@ static int store_color_common(struct device *dev, const char *buf, int color)
>         return 0;
>  }
>
> -static ssize_t show_red(struct device *dev, struct device_attribute *attr,
> +static ssize_t red_show(struct device *dev, struct device_attribute *attr,
>                         char *buf)
>  {
>         return show_color_common(dev, buf, RED);
>  }
>
> -static ssize_t store_red(struct device *dev, struct device_attribute *attr,
> +static ssize_t red_store(struct device *dev, struct device_attribute *attr,
>                          const char *buf, size_t count)
>  {
>         int ret;
> @@ -209,15 +209,15 @@ static ssize_t store_red(struct device *dev, struct device_attribute *attr,
>         return count;
>  }
>
> -static DEVICE_ATTR(red, S_IRUGO | S_IWUSR, show_red, store_red);
> +static DEVICE_ATTR_RW(red);
>
> -static ssize_t show_green(struct device *dev, struct device_attribute *attr,
> +static ssize_t green_show(struct device *dev, struct device_attribute *attr,
>                           char *buf)
>  {
>         return show_color_common(dev, buf, GREEN);
>  }
>
> -static ssize_t store_green(struct device *dev, struct device_attribute *attr,
> +static ssize_t green_store(struct device *dev, struct device_attribute *attr,
>                            const char *buf, size_t count)
>  {
>
> @@ -229,15 +229,15 @@ static ssize_t store_green(struct device *dev, struct device_attribute *attr,
>         return count;
>  }
>
> -static DEVICE_ATTR(green, S_IRUGO | S_IWUSR, show_green, store_green);
> +static DEVICE_ATTR_RW(green);
>
> -static ssize_t show_blue(struct device *dev, struct device_attribute *attr,
> +static ssize_t blue_show(struct device *dev, struct device_attribute *attr,
>                          char *buf)
>  {
>         return show_color_common(dev, buf, BLUE);
>  }
>
> -static ssize_t store_blue(struct device *dev, struct device_attribute *attr,
> +static ssize_t blue_store(struct device *dev, struct device_attribute *attr,
>                           const char *buf, size_t count)
>  {
>         int ret;
> @@ -248,16 +248,16 @@ static ssize_t store_blue(struct device *dev, struct device_attribute *attr,
>         return count;
>  }
>
> -static DEVICE_ATTR(blue, S_IRUGO | S_IWUSR, show_blue, store_blue);
> +static DEVICE_ATTR_RW(blue);
>
> -static ssize_t show_test(struct device *dev, struct device_attribute *attr,
> +static ssize_t test_show(struct device *dev, struct device_attribute *attr,
>                          char *buf)
>  {
>         return scnprintf(buf, PAGE_SIZE,
>                          "#Write into test to start test sequence!#\n");
>  }
>
> -static ssize_t store_test(struct device *dev, struct device_attribute *attr,
> +static ssize_t test_store(struct device *dev, struct device_attribute *attr,
>                           const char *buf, size_t count)
>  {
>
> @@ -273,7 +273,7 @@ static ssize_t store_test(struct device *dev, struct device_attribute *attr,
>         return count;
>  }
>
> -static DEVICE_ATTR(test, S_IRUGO | S_IWUSR, show_test, store_test);
> +static DEVICE_ATTR_RW(test);
>
>  /* TODO: HSB, fade, timeadj, script ... */
>
> diff --git a/drivers/leds/leds-lm3530.c b/drivers/leds/leds-lm3530.c
> index 2f8362f6bf75..2db455efd4b1 100644
> --- a/drivers/leds/leds-lm3530.c
> +++ b/drivers/leds/leds-lm3530.c
> @@ -346,8 +346,8 @@ static void lm3530_brightness_set(struct led_classdev *led_cdev,
>         }
>  }
>
> -static ssize_t lm3530_mode_get(struct device *dev,
> -               struct device_attribute *attr, char *buf)
> +static ssize_t mode_show(struct device *dev,
> +                        struct device_attribute *attr, char *buf)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
>         struct lm3530_data *drvdata;
> @@ -365,8 +365,8 @@ static ssize_t lm3530_mode_get(struct device *dev,
>         return len;
>  }
>
> -static ssize_t lm3530_mode_set(struct device *dev, struct device_attribute
> -                                  *attr, const char *buf, size_t size)
> +static ssize_t mode_store(struct device *dev, struct device_attribute
> +                         *attr, const char *buf, size_t size)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
>         struct lm3530_data *drvdata;
> @@ -397,7 +397,7 @@ static ssize_t lm3530_mode_set(struct device *dev, struct device_attribute
>
>         return sizeof(drvdata->mode);
>  }
> -static DEVICE_ATTR(mode, 0644, lm3530_mode_get, lm3530_mode_set);
> +static DEVICE_ATTR_RW(mode);
>
>  static struct attribute *lm3530_attrs[] = {
>         &dev_attr_mode.attr,
> diff --git a/drivers/leds/leds-lm355x.c b/drivers/leds/leds-lm355x.c
> index 1505521249b5..2d3e11845ba5 100644
> --- a/drivers/leds/leds-lm355x.c
> +++ b/drivers/leds/leds-lm355x.c
> @@ -349,9 +349,9 @@ static int lm355x_indicator_brightness_set(struct led_classdev *cdev,
>  }
>
>  /* indicator pattern only for lm3556*/
> -static ssize_t lm3556_indicator_pattern_store(struct device *dev,
> -                                             struct device_attribute *attr,
> -                                             const char *buf, size_t size)
> +static ssize_t pattern_store(struct device *dev,
> +                            struct device_attribute *attr,
> +                            const char *buf, size_t size)
>  {
>         ssize_t ret;
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
> @@ -381,7 +381,7 @@ static ssize_t lm3556_indicator_pattern_store(struct device *dev,
>         return ret;
>  }
>
> -static DEVICE_ATTR(pattern, S_IWUSR, NULL, lm3556_indicator_pattern_store);
> +static DEVICE_ATTR_WO(pattern);
>
>  static struct attribute *lm355x_indicator_attrs[] = {
>         &dev_attr_pattern.attr,
> diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
> index 62c14872caf7..8007b82985a8 100644
> --- a/drivers/leds/leds-lm3642.c
> +++ b/drivers/leds/leds-lm3642.c
> @@ -165,9 +165,9 @@ static int lm3642_control(struct lm3642_chip_data *chip,
>  /* torch */
>
>  /* torch pin config for lm3642 */
> -static ssize_t lm3642_torch_pin_store(struct device *dev,
> -                                     struct device_attribute *attr,
> -                                     const char *buf, size_t size)
> +static ssize_t torch_pin_store(struct device *dev,
> +                              struct device_attribute *attr,
> +                              const char *buf, size_t size)
>  {
>         ssize_t ret;
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
> @@ -193,7 +193,7 @@ static ssize_t lm3642_torch_pin_store(struct device *dev,
>         return size;
>  }
>
> -static DEVICE_ATTR(torch_pin, S_IWUSR, NULL, lm3642_torch_pin_store);
> +static DEVICE_ATTR_WO(torch_pin);
>
>  static int lm3642_torch_brightness_set(struct led_classdev *cdev,
>                                         enum led_brightness brightness)
> @@ -212,9 +212,9 @@ static int lm3642_torch_brightness_set(struct led_classdev *cdev,
>  /* flash */
>
>  /* strobe pin config for lm3642*/
> -static ssize_t lm3642_strobe_pin_store(struct device *dev,
> -                                      struct device_attribute *attr,
> -                                      const char *buf, size_t size)
> +static ssize_t strobe_pin_store(struct device *dev,
> +                               struct device_attribute *attr,
> +                               const char *buf, size_t size)
>  {
>         ssize_t ret;
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
> @@ -240,7 +240,7 @@ static ssize_t lm3642_strobe_pin_store(struct device *dev,
>         return size;
>  }
>
> -static DEVICE_ATTR(strobe_pin, S_IWUSR, NULL, lm3642_strobe_pin_store);
> +static DEVICE_ATTR_WO(strobe_pin);
>
>  static int lm3642_strobe_brightness_set(struct led_classdev *cdev,
>                                          enum led_brightness brightness)
> diff --git a/drivers/leds/leds-max8997.c b/drivers/leds/leds-max8997.c
> index 512a11d142d0..c0bddb33888d 100644
> --- a/drivers/leds/leds-max8997.c
> +++ b/drivers/leds/leds-max8997.c
> @@ -160,8 +160,8 @@ static void max8997_led_brightness_set(struct led_classdev *led_cdev,
>         }
>  }
>
> -static ssize_t max8997_led_show_mode(struct device *dev,
> -                               struct device_attribute *attr, char *buf)
> +static ssize_t mode_show(struct device *dev,
> +                        struct device_attribute *attr, char *buf)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
>         struct max8997_led *led =
> @@ -193,9 +193,9 @@ static ssize_t max8997_led_show_mode(struct device *dev,
>         return ret;
>  }
>
> -static ssize_t max8997_led_store_mode(struct device *dev,
> -                               struct device_attribute *attr,
> -                               const char *buf, size_t size)
> +static ssize_t mode_store(struct device *dev,
> +                         struct device_attribute *attr,
> +                         const char *buf, size_t size)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
>         struct max8997_led *led =
> @@ -222,7 +222,7 @@ static ssize_t max8997_led_store_mode(struct device *dev,
>         return size;
>  }
>
> -static DEVICE_ATTR(mode, 0644, max8997_led_show_mode, max8997_led_store_mode);
> +static DEVICE_ATTR_RW(mode);
>
>  static struct attribute *max8997_attrs[] = {
>         &dev_attr_mode.attr,
> diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
> index 68fbf0b66fad..77213b79f84d 100644
> --- a/drivers/leds/leds-netxbig.c
> +++ b/drivers/leds/leds-netxbig.c
> @@ -204,9 +204,9 @@ static void netxbig_led_set(struct led_classdev *led_cdev,
>         spin_unlock_irqrestore(&led_dat->lock, flags);
>  }
>
> -static ssize_t netxbig_led_sata_store(struct device *dev,
> -                                     struct device_attribute *attr,
> -                                     const char *buff, size_t count)
> +static ssize_t sata_store(struct device *dev,
> +                         struct device_attribute *attr,
> +                         const char *buff, size_t count)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
>         struct netxbig_led_data *led_dat =
> @@ -255,8 +255,8 @@ static ssize_t netxbig_led_sata_store(struct device *dev,
>         return ret;
>  }
>
> -static ssize_t netxbig_led_sata_show(struct device *dev,
> -                                    struct device_attribute *attr, char *buf)
> +static ssize_t sata_show(struct device *dev,
> +                        struct device_attribute *attr, char *buf)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
>         struct netxbig_led_data *led_dat =
> @@ -265,7 +265,7 @@ static ssize_t netxbig_led_sata_show(struct device *dev,
>         return sprintf(buf, "%d\n", led_dat->sata);
>  }
>
> -static DEVICE_ATTR(sata, 0644, netxbig_led_sata_show, netxbig_led_sata_store);
> +static DEVICE_ATTR_RW(sata);
>
>  static struct attribute *netxbig_led_attrs[] = {
>         &dev_attr_sata.attr,
> diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
> index 245de443fe9c..a6992323d69d 100644
> --- a/drivers/leds/leds-ss4200.c
> +++ b/drivers/leds/leds-ss4200.c
> @@ -441,8 +441,8 @@ static void set_power_light_amber_noblink(void)
>         nasgpio_led_set_brightness(&amber->led_cdev, LED_FULL);
>  }
>
> -static ssize_t nas_led_blink_show(struct device *dev,
> -                                 struct device_attribute *attr, char *buf)
> +static ssize_t blink_show(struct device *dev,
> +                         struct device_attribute *attr, char *buf)
>  {
>         struct led_classdev *led = dev_get_drvdata(dev);
>         int blinking = 0;
> @@ -451,9 +451,9 @@ static ssize_t nas_led_blink_show(struct device *dev,
>         return sprintf(buf, "%u\n", blinking);
>  }
>
> -static ssize_t nas_led_blink_store(struct device *dev,
> -                                  struct device_attribute *attr,
> -                                  const char *buf, size_t size)
> +static ssize_t blink_store(struct device *dev,
> +                          struct device_attribute *attr,
> +                          const char *buf, size_t size)
>  {
>         int ret;
>         struct led_classdev *led = dev_get_drvdata(dev);
> @@ -468,7 +468,7 @@ static ssize_t nas_led_blink_store(struct device *dev,
>         return size;
>  }
>
> -static DEVICE_ATTR(blink, 0644, nas_led_blink_show, nas_led_blink_store);
> +static DEVICE_ATTR_RW(blink);
>
>  static struct attribute *nasgpio_led_attrs[] = {
>         &dev_attr_blink.attr,
> diff --git a/drivers/leds/leds-wm831x-status.c b/drivers/leds/leds-wm831x-status.c
> index 67f4235cb28a..c48b80574f02 100644
> --- a/drivers/leds/leds-wm831x-status.c
> +++ b/drivers/leds/leds-wm831x-status.c
> @@ -155,8 +155,8 @@ static const char * const led_src_texts[] = {
>         "soft",
>  };
>
> -static ssize_t wm831x_status_src_show(struct device *dev,
> -                                     struct device_attribute *attr, char *buf)
> +static ssize_t src_show(struct device *dev,
> +                       struct device_attribute *attr, char *buf)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
>         struct wm831x_status *led = to_wm831x_status(led_cdev);
> @@ -178,9 +178,9 @@ static ssize_t wm831x_status_src_show(struct device *dev,
>         return ret;
>  }
>
> -static ssize_t wm831x_status_src_store(struct device *dev,
> -                                      struct device_attribute *attr,
> -                                      const char *buf, size_t size)
> +static ssize_t src_store(struct device *dev,
> +                        struct device_attribute *attr,
> +                        const char *buf, size_t size)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
>         struct wm831x_status *led = to_wm831x_status(led_cdev);
> @@ -197,7 +197,7 @@ static ssize_t wm831x_status_src_store(struct device *dev,
>         return size;
>  }
>
> -static DEVICE_ATTR(src, 0644, wm831x_status_src_show, wm831x_status_src_store);
> +static DEVICE_ATTR_RW(src);
>
>  static struct attribute *wm831x_status_attrs[] = {
>         &dev_attr_src.attr,
> --
> 2.27.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
