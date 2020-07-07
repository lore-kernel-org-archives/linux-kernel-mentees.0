Return-Path: <SRS0=keMi=AS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACDB2C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 05:33:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7657520772
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 05:33:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qXMaZ05O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7657520772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4528A89477;
	Tue,  7 Jul 2020 05:33:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WifUcMhz6g2U; Tue,  7 Jul 2020 05:33:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B49C78946E;
	Tue,  7 Jul 2020 05:33:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7FC5C0893;
	Tue,  7 Jul 2020 05:33:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6399C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 05:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BF1CD255B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 05:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ve8uKR0Ebowx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 05:33:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id CA6BA255A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 05:33:12 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id m22so9096910pgv.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Jul 2020 22:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+JFD8DByOq2aanx0SZRhh+Vls72xH1YM2iTf6wGQD9M=;
 b=qXMaZ05OPFr8XghZ/DM63tq49n93UeuV/Tc74NdaAS/mIzVXphXqFj1xMbNAlrg9Bk
 ZD6ySib361st7B7RlnQqiTAh0DS6PpASJXHHLgqkI8Wn/E1/plyR8w4TRds00MTmRxfb
 1NzIHYmy9/oQiborDAnFYxHmbal4TIE/oN2w16I3HLi/+2PuPUE6tN0xEgszIiljtzdH
 0Mz9yENEO51MVkFIzFjAMHYpaZ3sttpzmPsOFEgWYlOupYIw7mdbqfJGpv2UJ2VLMKN3
 Dq8RE8lW+2cp+dhtiZMtdaoK9A4uUHM7pBZ1/L1gbZX4ZmNTBpz5EK9hUjBzFcL2bi/u
 fCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+JFD8DByOq2aanx0SZRhh+Vls72xH1YM2iTf6wGQD9M=;
 b=h9St1R417cm99EnHMRAHVhh3JNgeepyc8Kt5mejYR8F/1pNiUYVIIa8pN9dJMNg/9T
 oiKESzZHJykWz9hiO9bpjCilxXPTqFtiK/WynXNbeaeKrBRPBbZEkelDIxdMJ9ukNCUv
 ibr58kpVhRKP2G6avYjoKs+CFfufx17Q9i5X18jpKxxsx1504uqO/XN53WCMA89F6K3y
 ExySnz533qOxSZTOKp0HQFits+8ZYmaGtjtIuTAP6MpB4NMGLN7LG2bi8ebKcpNgQn7V
 DrtVPXCB8D+L50MqNth5FAtRpMi3zpAoNbbamsYZvBUpS4Q21KM0KmpAxAJ9Pz5JzdyU
 KU1w==
X-Gm-Message-State: AOAM530RQ4eyzlpQ5tJ74GYOMQc0EcsHUzhkcPhKlrpvMCPsddhywA6A
 2uzbO9fIYyszvFdXMnu1H2I=
X-Google-Smtp-Source: ABdhPJyaySvye310FQsJb9Fg89bE8ENWrJzXsFp5usM1/bDJypggjC4+MWPThxUsb7RDHW0LuPmgwQ==
X-Received: by 2002:aa7:8391:: with SMTP id u17mr755529pfm.156.1594099992183; 
 Mon, 06 Jul 2020 22:33:12 -0700 (PDT)
Received: from localhost.localdomain ([117.214.135.157])
 by smtp.googlemail.com with ESMTPSA id h1sm13110023pgn.41.2020.07.06.22.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 22:33:11 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Date: Tue,  7 Jul 2020 11:02:52 +0530
Message-Id: <20200707053252.32703-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] Driver-API: Documentation: Replace
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
 Documentation/driver-api/device-io.rst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/driver-api/device-io.rst b/Documentation/driver-api/device-io.rst
index 0e389378f71d..764963876d08 100644
--- a/Documentation/driver-api/device-io.rst
+++ b/Documentation/driver-api/device-io.rst
@@ -36,14 +36,14 @@ are starting with one. Physical addresses are of type unsigned long.
 
 This address should not be used directly. Instead, to get an address
 suitable for passing to the accessor functions described below, you
-should call :c:func:`ioremap()`. An address suitable for accessing
+should call ioremap(). An address suitable for accessing
 the device will be returned to you.
 
 After you've finished using the device (say, in your module's exit
-routine), call :c:func:`iounmap()` in order to return the address
+routine), call iounmap() in order to return the address
 space to the kernel. Most architectures allocate new address space each
-time you call :c:func:`ioremap()`, and they can run out unless you
-call :c:func:`iounmap()`.
+time you call ioremap(), and they can run out unless you
+call iounmap().
 
 Accessing the device
 --------------------
@@ -60,8 +60,8 @@ readb_relaxed(), readw_relaxed(), readl_relaxed(), readq_relaxed(),
 writeb(), writew(), writel() and writeq().
 
 Some devices (such as framebuffers) would like to use larger transfers than
-8 bytes at a time. For these devices, the :c:func:`memcpy_toio()`,
-:c:func:`memcpy_fromio()` and :c:func:`memset_io()` functions are
+8 bytes at a time. For these devices, the memcpy_toio(),
+memcpy_fromio() and memset_io() functions are
 provided. Do not use memset or memcpy on IO addresses; they are not
 guaranteed to copy data in order.
 
@@ -135,15 +135,15 @@ Accessing Port Space
 
 Accesses to this space are provided through a set of functions which
 allow 8-bit, 16-bit and 32-bit accesses; also known as byte, word and
-long. These functions are :c:func:`inb()`, :c:func:`inw()`,
-:c:func:`inl()`, :c:func:`outb()`, :c:func:`outw()` and
-:c:func:`outl()`.
+long. These functions are inb(), inw(),
+inl(), outb(), outw() and
+outl().
 
 Some variants are provided for these functions. Some devices require
 that accesses to their ports are slowed down. This functionality is
 provided by appending a ``_p`` to the end of the function.
-There are also equivalents to memcpy. The :c:func:`ins()` and
-:c:func:`outs()` functions copy bytes, words or longs to the given
+There are also equivalents to memcpy. The ins() and
+outs() functions copy bytes, words or longs to the given
 port.
 
 Public Functions Provided
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
