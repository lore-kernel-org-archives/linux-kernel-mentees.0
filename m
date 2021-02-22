Return-Path: <SRS0=c16L=HY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6BBC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Feb 2021 18:09:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC15A64E25
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Feb 2021 18:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC15A64E25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 159936EB4D;
	Mon, 22 Feb 2021 18:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Auj3GsGOALYg; Mon, 22 Feb 2021 18:09:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FE5A6001E;
	Mon, 22 Feb 2021 18:09:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5CAD2C000A;
	Mon, 22 Feb 2021 18:09:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC629C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 18:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3002D6EB4D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 18:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NS-8SbI6aQzq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 18:09:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7FAE6001E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 18:09:43 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id u20so14207930iot.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 10:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+giKpRbegYYfbOyat5lyHFg99I4++GstldCObu1z82w=;
 b=GaaRmKxeR67OQoVmLXevbUUsL9qxK17fXoTFCZ3PIEa+MXI9+9xXs7/8pwsf3YpVTv
 tB2y/vkcDrZZpGKHyDG3XqsxEC97QJwO8ite2CqH+c9q3z1PINPHRE4nhjoqx7lM7/yd
 S+t+5ZQrpKOZ7e3xESmEs213W11mdN+LZiej9iZufgiOXlgW3x9Gqs34YbuisGQmO2uW
 5xbs/BgCxHFIq9O+vB3O4Uu9d4s5PxzaR52IK8Ooh8y0DWn2a7S9s9qjxG4TrxeaBfGB
 3M5PEQvSeelfNwZOCWbo7aqgei24aQio3GY4bFQRrEv9CtQbwhpvrHsZiuYwuo1DlY3v
 dMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+giKpRbegYYfbOyat5lyHFg99I4++GstldCObu1z82w=;
 b=LgDsEc+p2pa0SV5PVpSGwWh/rYe/wS2Z3rqqjAxgF3FAXhGFsyUU0H6F87SGvonrj4
 08KR/O0iDWD3Uavg0ejesBeOKCRMcw0h+ei6OELjLZ2QZ4EehnoXA0MEKkDF8ZNhhRTi
 a2Cepoh5+9kjk/nRgyrrGlQB0l4ntc3RHtq+sRYUvhWFZ2zdYRLoPZcl162AEmHHiWvN
 A5TJYvwCvK7haYQb8QoLWTKooWdgWfdt5EsU3KH59ec9mKo1TJ2A2XVxW4DDwoV6MNQJ
 PYfuOTAV1LJGj8ecBNs1RGfkU/ERnCqmeQcKNEJ1+JL695fJwbvZhL/lwAcBv8pZEd+I
 jqcA==
X-Gm-Message-State: AOAM532/Vy9os0njyDzBb6Ne+OYRF176ZuyOrJnDH77XK2pKNQNWE46w
 NH9MvoLEjspN1LDXLvrEWPEB8k7eE5mqIjMsb5E=
X-Google-Smtp-Source: ABdhPJwu/x3We4/pQ4Y4FXmVZq+ZxyPHRck/C5c6TTZLxn+mTRU0uSshu5w3Vt5KSr+xiwXgT883A/jM2ipmN0cmvYk=
X-Received: by 2002:a05:6602:314b:: with SMTP id
 m11mr2852611ioy.158.1614017381531; 
 Mon, 22 Feb 2021 10:09:41 -0800 (PST)
MIME-Version: 1.0
References: <5933570a-7768-26b2-40d0-1acac999d9f6@gmail.com>
In-Reply-To: <5933570a-7768-26b2-40d0-1acac999d9f6@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 22 Feb 2021 19:09:30 +0100
Message-ID: <CAKXUXMzBACaZzGkoF772y0pySc+UKyK_iW967nJkJTtVc93+LA@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Jonathan Corbet <corbet@lwn.net>
Subject: Re: [Linux-kernel-mentees] Investigating parsing error for
	struct/union
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

On Mon, Feb 22, 2021 at 6:27 PM Aditya <yashsri421@gmail.com> wrote:
>
> Hi Jonathan, Lukas
>
> While investigating "error: Cannot parse struct or union!", I
> discovered few more patterns causing this error:
> 1) A large part of this error(~80%) occurs due to the presence of one
> or more lines(such as '#define' lines) between commented code and
> struct declaration.
>
> For e.g., in include/linux/platform_data/apds990x.h:
>
> /**
>  * struct apds990x_chip_factors - defines effect of the cover window
>  * @ga: Total glass attenuation
>  * @cf1: clear channel factor 1 for raw to lux conversion
>  * @irf1: IR channel factor 1 for raw to lux conversion
>  * @cf2: clear channel factor 2 for raw to lux conversion
>  * @irf2: IR channel factor 2 for raw to lux conversion
>  * @df: device factor for conversion formulas
>  *
>  * Structure for tuning ALS calculation to match with environment.
>  * Values depend on the material above the sensor and the sensor
>  * itself. If the GA is zero, driver will use uncovered sensor default
> values
>  * format: decimal value * APDS_PARAM_SCALE except df which is plain
> integer.
>  */
> #define APDS_PARAM_SCALE 4096
> struct apds990x_chip_factors {
>         int ga;
>         int cf1;
>         int irf1;
>         int cf2;
>         int irf2;
>         int df;
> };
>
>

Aditya, I independently made a similar observation and noted this
issue in my personal notes, which will serve for a cleanup patch
series, as follows:

"SKIP DEFINITIONS" Feature:

The kernel-doc should proceed the code, and the required definition of
data structures should stay close to the function in between the
kernel-doc comment and the function definition.

Let kernel-doc know to skip certain definitions; the actual definition
documented will follow directly after the skipped definitions.

E.g.,

include/linux/cgroup.h:450: task_css_set_check: SKIP DEFINITIONS
(struct mutex cgroup_mutex; spinlock_t css_set_lock)
include/linux/hid-sensor-hub.h:174:
sensor_hub_input_attr_get_raw_value: SKIP DEFINITIONS (enum
sensor_hub_read_flags)

I have not thought about a good syntax for that:

maybe something like:
/**
* foo - description
*
* @arg: description
*
* ::skip: struct bar, enum blub, define MACRO
*/

where "::" serves as some annotation to instruct kernel-doc

> 2) If struct does not contain any members, for e.g., in
> include/linux/xz.h:
>
> /**
>  * struct xz_dec - Opaque type to hold the XZ decoder state
>  */
> struct xz_dec;
>
> Here, it causes error as the curly braces and members expected by the
> regex, are absent.
> This kind of use has also been made in include/linux/zstd.h:
>
> /**
>  * struct ZSTD_DDict - a digested dictionary to be used for decompression
>  */
> typedef struct ZSTD_DDict_s ZSTD_DDict;
>
>
> 3) Different Syntax than expected. For e.g.:
>     a) struct xyz struct_name {} syntax. This syntax has been used in
> arch/arm/mach-omap2/omap_hwmod_common_data.c file
>     b) "static __maybe_unused const struct st_sensors_platform_data
> default_press_pdata = {" in drivers/iio/pressure/st_pressure.h.
> This kind of syntax has also been used in
> drivers/iio/accel/st_accel.h, and drivers/iio/gyro/st_gyro.h
>
> I wanted to take your opinion if we should extend support for any of
> these syntax, causing the error. If not, perhaps we can make the
> documentation a bit clear, atleast for (1), which causes most of these
> errors; so as to not include any lines between comment and struct
> declaration.
>
> What do you think?
>

I certainly appreciate it if you could work on that SKIP_DEFINITION
feature, once we agreed on some first syntax for this feature.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
