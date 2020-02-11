Return-Path: <SRS0=w6iK=37=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E87C352A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 14:02:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDA5920870
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 14:02:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acvYgbSd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDA5920870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BD60B8643F;
	Tue, 11 Feb 2020 14:02:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xlp8uyJwdIdq; Tue, 11 Feb 2020 14:02:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 86FCE86418;
	Tue, 11 Feb 2020 14:02:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70C46C1D80;
	Tue, 11 Feb 2020 14:02:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EFC5C07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 14:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5C1DC8266F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 14:01:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01cL3zL8G3Gz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 14:01:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F078B823B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 14:01:58 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id u131so5761409pgc.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 06:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S1++7kP6tXDKBd34NXZh/jrm4XImjEMB0GxCEH/3wBU=;
 b=acvYgbSdKsbxXiAamIo24G7YR39D/eTfJrVvRPU414RqjG5m11zdEDz/LzZ3kaDdK5
 U1RE+Rd8mG/KpR363XWKtIrKWSD8iNmmMm6e1Pgirp7yctsMrc9MwxyAemS4vMzV/WfQ
 Ai1IQHsT9jtyxIvd7I9fY+cIaRqwfWHJyqI1Hqj+l5Zn5+esUbUrvuBpxgLmSes8k7qA
 bBT5mveJWf5plUa0TJmwi+/xzTXNAawKjGojuvKQt6HJpXUBNfUiAnTdW54hN9Qm7JA1
 0ed13uc1Ej+kIVR/1IIVhg9PeZkcnGPaW0pZth8Rb/05iqg0OTzZJunCiSr2NSY+HDd5
 5QgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S1++7kP6tXDKBd34NXZh/jrm4XImjEMB0GxCEH/3wBU=;
 b=n53X/gq73ZJQYyoWlV+U/TTmhyjMKByNguS9qtcCsaeY0/PbDNNMohKi7OYx3m3IEO
 kYfomjfE4IfqhDfcqDV7jlnomwYSeIEi1ldCry9/31XiOa2h7MPrqJxuew9OvQPWEvaF
 6vYw/OBnboqOXUYZK/wxoaA6UipgHFgwPkZyDUasT0voem+GLZe3Qhq38hRAVnIyI9sc
 MQmhXhoXlv90c6pjXPkJT/itpU9CXOil5mKnnuDF+X3Y62qzvZEugaaIspKEV/Z7BIsM
 7OKV8EPZKLMKW63MJ39l3lnoko/A0ijx/eo91Bk4x+aFPfCQ8eWZ55SG60c8JmbOJBE3
 x1ng==
X-Gm-Message-State: APjAAAXjShWR/RB6/akI321tYZSYIeNliBrsXNnHCtUt7OrIfVxDmGoC
 3j+Qle4Nop8FAFWu4yghBsE=
X-Google-Smtp-Source: APXvYqxdPTd1uTFRCdsF1L5Ty2PH1WiVF0BIxPvLjlM4agf51abg0KACwcUMPZSPEQ7/d30HxIl3Jw==
X-Received: by 2002:aa7:96b6:: with SMTP id g22mr6617712pfk.206.1581429707966; 
 Tue, 11 Feb 2020 06:01:47 -0800 (PST)
Received: from localhost.localdomain ([2405:204:22ac:7250:d1c8:6411:2f12:731d])
 by smtp.gmail.com with ESMTPSA id z26sm4203575pgu.80.2020.02.11.06.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 06:01:47 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 11 Feb 2020 19:31:34 +0530
Message-Id: <20200211140137.2304-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v5 0/3] cocci: Align the C AST and
	Cocci AST for pointer
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

This series is to address the type matching problem in Coccinelle.

Patch 1/3 is for aligning the C and Cocci AST so that
pointer to const pointer and its variants can be matched.

Patch 2/3 reflects the pretty printing changes made in 
1/3 in the ptrconstptr test case. A space is added between
the * and const.

Patch 3/3 consists of a test case for matching a pointer to
const pointer and its variants.

Changes in v5:
--------------
- Remove unnecessary parantheses and return of unit in Patch 1/3.
- Have the test case in Patch 3/3 conform more closely with the
  Linux kernel coding style.

Changes in v4:
--------------
- Fix coding style w/r/t placement of comment with List.iter and
  the qualifier printing function.

Changes in v3:
--------------
- Add a space between the * and qualifier in Patch 1/3.
- Add Patch 2/3 to add a space between * and const in the test
  case ptrconstptr.

Changes in v2:
--------------
- Change body and subject of Patch 2/2 as per suggestion of Markus
  Elfring.

[PATCH v5 1/3] parsing_c: Align C AST and Cocci AST for pointer
[PATCH v5 2/3] tests: Add space between * and const in
[PATCH v5 3/3] tests: Add test case to match const pointer variants

 parsing_c/parser_c.mly      |    4 ++--
 parsing_c/pretty_print_c.ml |   15 ++++++++++-----
 tests/constptr.c            |    7 +++++++
 tests/constptr.cocci        |   19 +++++++++++++++++++
 tests/constptr.res          |    7 +++++++
 tests/ptrconstptr.res       |    2 +-
 6 files changed, 46 insertions(+), 8 deletions(-)

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
