Return-Path: <SRS0=fgSf=3F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4081AC33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 10:45:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EB0C2077B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 10:45:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBCZDkus"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EB0C2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D4E9A8610E;
	Thu, 16 Jan 2020 10:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BMCKqN8WwP7v; Thu, 16 Jan 2020 10:45:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E3F0C86149;
	Thu, 16 Jan 2020 10:45:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D88D9C1D81;
	Thu, 16 Jan 2020 10:45:31 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26429C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1636D20C92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:45:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GMIugUQLBj2r
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:45:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id D330A2038A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:45:23 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id q127so9695341pga.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 02:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=myF5TN/7ur/WUYuYxuyA6SqDr8NqYTmAOXQeQUpziIg=;
 b=nBCZDkus0IUdF35V5zeH+7cyEkvYJqGYtOBx+NsB0lyUFtVC0iWiGpd/yjNkwNs2tq
 QQxBbuZvf0GtFVYKlb8Pxr4lUvA6xPfWn1+XQRNRj3PaqT5vBY6E7lvEH//X80+6aYzP
 oTR1le3tt9rgz4GB8VCkTT2HyF9VqX5bXUiqZe9QlyUXyvldQ+K0eOZjS0b+kym0nj3z
 kn3jz+pdy16Mx7tS6jSHwn8g1n4rZantkOypU7gW9wsXDs7ZQS+ZTx5ATOXZYUjnx+HY
 hU06oFNebgIpirlPR7EFE0igVTRCyr27frsePGc0eA6bi4IbL7bHvGnUkybp3WTIKP4p
 L62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=myF5TN/7ur/WUYuYxuyA6SqDr8NqYTmAOXQeQUpziIg=;
 b=L2edn/tYIBzqJ8tmpyEqfjyEKmW/0U1O21k5ckx8UXiI3gcSp1qaF3fThLWoHp1/JB
 itcOQ3pNu29XO7uV4Zq7llJhCSRNWcWFWw6Za2EvWcpDPKp4Ox+XxehdXiOf1M1NhHKB
 CoZFUcPUgDCqeC9NeDpVD7jKNzkTIlI6tdzEWpOtdBVsH7TXZcD8ceUlZ/in8OWCG9co
 TV9qVPU8xfz3LSdLYEJNoo2QGYO4vsUeBgUxc1X5PRct+uJaywjqWXzJm0dGuRExcWhT
 lIL6iL7A41ZUTrK8ccew7Lvw4sJcr4kyS+mnV+LLoJ/OV+xdvTv3KkTXWk+YJgiIMNOn
 Yx6A==
X-Gm-Message-State: APjAAAUbgf97u7UB9pky5L6bYtFfriek0ACuXG0qJTO/Fc7OXe5/cyzz
 oOIoFCtsuw10S9AEY218NJM=
X-Google-Smtp-Source: APXvYqyZQx69I9NcKcWF1Qgu7oR/P7vhMeaDo3F4nxpKOQR999jbdIdvDh8IRy5Ltsv1jlHZuRKckQ==
X-Received: by 2002:a63:6c03:: with SMTP id h3mr36473536pgc.19.1579171523436; 
 Thu, 16 Jan 2020 02:45:23 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:1677:7d6f:b2c8:b07a:d4f3:9a2c])
 by smtp.gmail.com with ESMTPSA id a69sm25948799pfa.129.2020.01.16.02.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 02:45:23 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 16 Jan 2020 16:14:46 +0530
Message-Id: <20200116104448.15539-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200116051843.3328-1-jaskaransingh7654321@gmail.com>
References: <20200116051843.3328-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 0/2] cocci: Add space for tokens
	after *
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

The Pointer cases in pp_type_with_ident_rest and pp_type_left of
pretty_print_c.ml sometimes do not add a necessary space, if there
exist tokens after the *.

Create changes necessary for adding this space and add a test case
for * const *.

 parsing_c/pretty_print_c.ml |    4 ++++
 tests/ptrconstptr.c         |    3 +++
 tests/ptrconstptr.cocci     |    7 +++++++
 tests/ptrconstptr.res       |    3 +++
 4 files changed, 17 insertions(+)


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
