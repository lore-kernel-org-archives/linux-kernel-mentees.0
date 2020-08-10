Return-Path: <SRS0=Vbn0=BU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCBFC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 18:21:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DC09207FF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 18:21:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhbLVoAm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DC09207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2262E2262B;
	Mon, 10 Aug 2020 18:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I9tEaYfKXoPI; Mon, 10 Aug 2020 18:21:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 18138221F8;
	Mon, 10 Aug 2020 18:21:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E844BC013C;
	Mon, 10 Aug 2020 18:21:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83917C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7E14A878F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NXpzP23ajsFO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:21:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0720B878BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:21:41 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 128so5387393pgd.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 11:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+JFD8DByOq2aanx0SZRhh+Vls72xH1YM2iTf6wGQD9M=;
 b=OhbLVoAmgO0WtSwfbFIuvITgBG1A+Us1nAmbkAZn3bFQeE3X+l4rBRnyDfNAcPhS9G
 X/caSXxnAEXwluvvK8fIO0LBn5uuVKLykPO5/CzgZeOeIHVk5kSyfZ3YCQPPbgRS2cPV
 poQmNOEIEmD1ElgvvH1ThkKafEsPYVdLZSBn7QV0vumFefyCRldQNb/AZsaQmiSZi7pn
 459o0a16rVd6HWW+OjqZ0xqOs8HEb2dBLOImDUfrZ6gqXhvCVMhhqZVfdGiqeBF1f8sl
 e1dPLxwbXVgq4lkQIiab7Q36BFbHMtie6AwDT81jmITyz2/65UCkZg6oqyfP1sFDEk2H
 bWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+JFD8DByOq2aanx0SZRhh+Vls72xH1YM2iTf6wGQD9M=;
 b=UQLH0+07q2yDHZRu4se4ojthqnI7GUTaCI7pUZ5OKkEWt/cku3OFNwI+TkFJWZNeyc
 DFaocTGntAEFhzOZeGVDAMNRKJjtQQ0b7bh5hOo+RJ2I6QIP/b14A7J6p9kG8Ow2//Gj
 e+kzqmUJBr5+CA2MCQF+yihY6IrG0NBcXYNvyniYjVxwnda6OYixp+4ufzVKjTJXLn3Q
 KSvUsEqd0tjebMGjmPIEar6sSVnx2fHXo7viA6mBLSWBxv7UiEJ7ftRKlSyEiymYgiv4
 rJ6K7b4I01YW6ylbOma6QIQr37yA71s7HRKqSsNxXRyKtECCshd69SCJok7Xfvr6l4oX
 xudA==
X-Gm-Message-State: AOAM533Wk1NAEqcDdV3qdiyrZuTBpyypgElCqR0mAomBjGRkkwMxEvQF
 DsVf7LRVWl3aVQ1rfxrEM9A=
X-Google-Smtp-Source: ABdhPJwu+iKNRl9MVy9gLlxJdubMRx/+OdkJRXm4XqpZdr9WoC9uMx9DnGcenr2NxNJ6nOoQFzk8RA==
X-Received: by 2002:a63:4b63:: with SMTP id k35mr23855342pgl.235.1597083700496; 
 Mon, 10 Aug 2020 11:21:40 -0700 (PDT)
Received: from localhost.localdomain ([124.253.77.168])
 by smtp.googlemail.com with ESMTPSA id 80sm23176615pfy.147.2020.08.10.11.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 11:21:38 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Date: Mon, 10 Aug 2020 23:51:07 +0530
Message-Id: <20200810182107.18577-1-puranjay12@gmail.com>
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
