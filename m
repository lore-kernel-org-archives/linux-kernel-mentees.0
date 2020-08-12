Return-Path: <SRS0=//YW=BW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D2AC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Aug 2020 17:46:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C11D2076C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Aug 2020 17:46:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWypLrOM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C11D2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4872C86C0A;
	Wed, 12 Aug 2020 17:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YSlTJEwMUTis; Wed, 12 Aug 2020 17:46:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 38CB286BC1;
	Wed, 12 Aug 2020 17:46:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BBEFC07FF;
	Wed, 12 Aug 2020 17:46:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 242DBC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 17:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0725923504
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 17:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id deoSONxq-3N8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 17:46:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 457E723453
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 17:46:20 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t11so1440298plr.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 10:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IuzAjW4iKvUxBLY8x56IhZif1QbkoJsOqN2MFy5m4l0=;
 b=gWypLrOM5T6mYQAwyRTiMMZewfKrHEsWMAWduQqo1gX4T7FfZhkIjCKyTJ0u4VIDg0
 Dvvlk6EHVappqYQgvv9qOvryAHchLPZ8DRFCk0dCnNoUQq1kqDPUZ4iZFT/3plIvesbl
 fX+C7xadt3nbC6PPC6nqAVRXLrXsH6CnTO0IIrwQ2IBhnhk4cZsN1O27DOe1NvUOTYDM
 UijQmKSoRWeBTLKOFKKzugq2Jz0vCdnmOiAU6f9PneTPF8jHwiUOTsEEUGXC+/XZ8w0G
 THRlVyp03iXHX47jIffu+IhicGx/Nmx9Jpv8WjHqKcG2el+3Opbe7YmP5WbuVhT8YPv7
 Wl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IuzAjW4iKvUxBLY8x56IhZif1QbkoJsOqN2MFy5m4l0=;
 b=KTGnkjNDWHzDvGrSZAxzMgbomoonYuA/kgrRitHPROx8Yjq0apeo7nxFJyF6nFzC6P
 dszsrc2xFOZCwR0wpdqDyNWJuHQJb2XHcoO5LZ3zf81bgyGwdhmEBvHLVQIeKxxR5HRa
 W7Bd3o0Rh//6vSUkLGP26GT78s8v+TnEBOsVn7TnMNjwph/7+igsVvjC9sOhAV2+1WfH
 +YSrSrce4vkLDLt2kuVCQe15rdf4vkSI92U/UDnWS0gVCs3uTN8FVm+42EaVg+dhUVtB
 UVJ491S91XyUF7tBY5mvVqN9aT97D8n/F+aYUghTSP8YpTEbWyb9KeaxAsHQiFB8vXN+
 7RZA==
X-Gm-Message-State: AOAM531DzNJMhpm5ow6OX9ZhflCBtVo/a3aoXNpViXytSaS4jmtVy42Y
 Qtg9tEjavemuV4yrBaG4pGQ=
X-Google-Smtp-Source: ABdhPJwtVo58m4lD0N34u8UfQvwsUmq9F1IrsQkYZEoirNxr+nQ0a1pl5jcJcjIX9dkAto6LK8p6Pw==
X-Received: by 2002:a17:90a:fa92:: with SMTP id
 cu18mr1086668pjb.215.1597254379683; 
 Wed, 12 Aug 2020 10:46:19 -0700 (PDT)
Received: from localhost.localdomain ([124.253.105.122])
 by smtp.googlemail.com with ESMTPSA id lk16sm2829852pjb.13.2020.08.12.10.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 10:46:18 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Date: Wed, 12 Aug 2020 23:16:11 +0530
Message-Id: <20200812174611.18580-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] IIO: Documentation: Replace
	deprecated :c:func: Usage
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

Replace :c:func: with func() as the previous usage is deprecated.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 Documentation/driver-api/iio/core.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/driver-api/iio/core.rst b/Documentation/driver-api/iio/core.rst
index b0bc0c028cc5..51b21e002396 100644
--- a/Documentation/driver-api/iio/core.rst
+++ b/Documentation/driver-api/iio/core.rst
@@ -11,10 +11,10 @@ Industrial I/O Devices
 ----------------------
 
 * struct :c:type:`iio_dev` - industrial I/O device
-* :c:func:`iio_device_alloc()` - allocate an :c:type:`iio_dev` from a driver
-* :c:func:`iio_device_free()` - free an :c:type:`iio_dev` from a driver
-* :c:func:`iio_device_register()` - register a device with the IIO subsystem
-* :c:func:`iio_device_unregister()` - unregister a device from the IIO
+* iio_device_alloc() - allocate an :c:type:`iio_dev` from a driver
+* iio_device_free() - free an :c:type:`iio_dev` from a driver
+* iio_device_register() - register a device with the IIO subsystem
+* iio_device_unregister() - unregister a device from the IIO
   subsystem
 
 An IIO device usually corresponds to a single hardware sensor and it
@@ -34,17 +34,17 @@ A typical IIO driver will register itself as an :doc:`I2C <../i2c>` or
 
 At probe:
 
-1. Call :c:func:`iio_device_alloc()`, which allocates memory for an IIO device.
+1. Call iio_device_alloc(), which allocates memory for an IIO device.
 2. Initialize IIO device fields with driver specific information (e.g.
    device name, device channels).
-3. Call :c:func:`iio_device_register()`, this registers the device with the
+3. Call iio_device_register(), this registers the device with the
    IIO core. After this call the device is ready to accept requests from user
    space applications.
 
 At remove, we free the resources allocated in probe in reverse order:
 
-1. :c:func:`iio_device_unregister()`, unregister the device from the IIO core.
-2. :c:func:`iio_device_free()`, free the memory allocated for the IIO device.
+1. iio_device_unregister(), unregister the device from the IIO core.
+2. iio_device_free(), free the memory allocated for the IIO device.
 
 IIO device sysfs interface
 ==========================
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
