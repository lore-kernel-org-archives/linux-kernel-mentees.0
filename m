Return-Path: <SRS0=A+ee=ZT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F42C432C3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Nov 2019 17:39:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32CE42071E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Nov 2019 17:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTg0p3lu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32CE42071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E751D204CF;
	Wed, 27 Nov 2019 17:39:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5g+qUZoBBXQL; Wed, 27 Nov 2019 17:39:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D651520478;
	Wed, 27 Nov 2019 17:39:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0A38C1DDA;
	Wed, 27 Nov 2019 17:39:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1D54C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 17:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 90F5087A60
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 17:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h6XyeZhDNZ69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 17:39:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B6D0A87A52
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 17:39:18 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id s5so11351140pfh.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 09:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hAdHg+nMpBBpnhQAb4eQYvBwAsK1HxagWWhgNhFJul8=;
 b=eTg0p3lupqzPqMOI2f1yhQdYjVCeKMOc+YaPpSgPujuist0u/SSCeFXY4DtCM7Gx/Q
 VIaSJsK6buyzzDpimQ2PuLelc8gVzPjFq7eNKhF2InyJaGG4g4FP/5+WqH0pYdo5ME5C
 /X1/PzrdX1AlIt5qa8E1+7gHnJM7D/bM15EP5yCPXRHYDS/IFZjZ1kHU5OusQCqxptQa
 u/3ADnUDKo5YZtqbjMp5dzXaKtyQhjFstDaggAjt6GeZXuNxA5IOGoxH92jkNaQA0Ikt
 E5uHJYUF5okAtmCdoWtul03aYKnZylvmCfWEHPJ3wm9n+0+yzchwTcs7FvLEUsIcQF7X
 4y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hAdHg+nMpBBpnhQAb4eQYvBwAsK1HxagWWhgNhFJul8=;
 b=F6eb39gjQ3wpdRYvciA99L97MRBmr0KLtfYrilHxOHi4FgSyWhXMQBLVPuAfAj5Kyj
 CCOBisFmyw10mfpgiwQKZMjDETW0wX3A8DJrPrzTytVQGG/g56jhi0/Fq+00hyMk7G1r
 ZLNMUUu+UdTI09N0RhJnp7K46Mmw9qyVzFxO9ikknujHKgYe+r/ug73WrTM5gHSw0qwi
 +swXFWo+Y7QYUUMKIlzT6yF9grp0U2Sr6HCP5WSZFPjdBKVaT3x9v+tjfoxcl2HsvpNA
 xR7RqzF8zgqq06xBi73Hx3Ly3YK11yElRPje5NEs+u7XgXhWVXEnCgRJjWXNPL7UFXdH
 vsdA==
X-Gm-Message-State: APjAAAXP7wuBpsvvtH8Vq36LsuWjcPjLcD0lq4/UaMltAdtidPxs3jRM
 /5FeVLP5yExkxANrec2b51c=
X-Google-Smtp-Source: APXvYqxjM0+LoGgNkAM6hzc8u+gHxKQq9hjlbYUWAaAZVMfXG1sCKWFiRJaFUPuqOOvzj9rwHoBQTg==
X-Received: by 2002:a62:e105:: with SMTP id q5mr48917809pfh.105.1574876358295; 
 Wed, 27 Nov 2019 09:39:18 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:167f:97a7:3939:930e:5cf8:fd50])
 by smtp.googlemail.com with ESMTPSA id j23sm17028240pfe.95.2019.11.27.09.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 09:39:17 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Wed, 27 Nov 2019 23:08:13 +0530
Message-Id: <20191127173815.24988-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 0/2] cocci: Fix continue statement of
	death and similar cases
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

The following patch series is for fixing the "continue statement of
death" report here:

https://www.mail-archive.com/cocci@systeme.lip6.fr/msg06199.html

Changes include removing circular references that cause the crash
and adding a corresponding test case.

 engine/transformation_c.ml         |    2 +-
 tests/stmt_removed_and_added.c     |    8 ++++++++
 tests/stmt_removed_and_added.cocci |    7 +++++++
 tests/stmt_removed_and_added.res   |    8 ++++++++
 4 files changed, 24 insertions(+), 1 deletion(-)


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
