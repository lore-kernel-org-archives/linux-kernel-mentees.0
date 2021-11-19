Return-Path: <SRS0=X1C9=QG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B295CC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Nov 2021 11:07:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66AD461994
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Nov 2021 11:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66AD461994
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F00F823CB;
	Fri, 19 Nov 2021 11:07:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fq3SueNLqu3f; Fri, 19 Nov 2021 11:07:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4549781C2F;
	Fri, 19 Nov 2021 11:07:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FB89C001E;
	Fri, 19 Nov 2021 11:07:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0523CC0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Nov 2021 11:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E527340368
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Nov 2021 11:07:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SL3TPWbs01au
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Nov 2021 11:07:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2374440363
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Nov 2021 11:07:23 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id r23so8308821pgu.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Nov 2021 03:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ng8l4wsQzx4FyhspTcTbEghmGNKsvxAsvNHV4AmOCM4=;
 b=kwlBwdtHtIA5uGGdZqmEgUdYyt8G1rr8m3w7P2n3XQNNdqbheivwlu3QGRD24/ffE1
 Akfd4EtfB7NK9F668PZXMoCvZ4PCdO+BeTQZgf1dM5iq1vKym4c5LJdR32vCm+QXMqW4
 oVin56heQxqgfVHmAt+asxQGhUIHPJZvWqOUKtVRaWrQQenAAPwBmGLKFM22PUIomwiN
 Gge0dXF3hBHGoDSBRUyLzlPeXzaNNbeNY1RlqePbgh22zF6DShJAcfZtc7nLBUblhUCF
 OniieqSdAtXs4GqVIQaZvweoQFu85yedOlj3FhpOcO60qYhH+/KrVKy0a0bnaFtBeo+O
 LQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ng8l4wsQzx4FyhspTcTbEghmGNKsvxAsvNHV4AmOCM4=;
 b=N4fzvBbzRKHyGk0WSpte5elUHy2IefDqcAB3rFwt60357PTbXvmkgn4IKzJS+MaMU1
 kxnaH5fp+DnxOhOMo3zJHCFAxg/3sqAI64TIp2XyC4hwv0OLkTpKK8KPe67xuMqggFsX
 RnF87/6r+pbOgO5laW8NwpTM9BGF2Htb9B+3sXr6Lq1ht1JkWnkto61z+rsCA1Y1Rfa7
 ggdqG8ieDWsbArHsp34fs9m9JmRHymj/Wz62eYlw7joYTPcnueqrf+/qf7QzgRDEVVsF
 ny5gP2eNf5HqTWXGrbtvYSZ0m0h2JZc+ruhv7Ata5f4UDcOmJmDAzg3803aHuqMx7Ik1
 zsRQ==
X-Gm-Message-State: AOAM530qpzS/mVhXvv1tHrZLTU0QoOWotDrsjc4bjUAOF5ZrP7R+TJS5
 YEDWpeYVJXvpWajGI1gPLKw=
X-Google-Smtp-Source: ABdhPJxwBKk+vMnQ3lECFETlnGOjmmzm038+PS3pNbOX2tQZMAPHTTo4LYcoIe1EapXzblpX+a1ZuA==
X-Received: by 2002:aa7:9d9e:0:b0:4a0:25d0:a06f with SMTP id
 f30-20020aa79d9e000000b004a025d0a06fmr22760213pfq.82.1637320042290; 
 Fri, 19 Nov 2021 03:07:22 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:63:2c47:da89:58f9:fd04:7bf9])
 by smtp.gmail.com with ESMTPSA id
 ne7sm10515484pjb.36.2021.11.19.03.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 03:07:21 -0800 (PST)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v4 0/1] PCI: Initial KUnit test fixture for resource assignment
Date: Fri, 19 Nov 2021 16:37:06 +0530
Message-Id: <cover.1637319848.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Currently it's hard to deubg issues in the resource assignment code of
the PCI because of the long reproduction cycles between the developer
trying to fix the code and the user testing it due to the lack of
hardware device with the developer [1].

[1]:
https://lore.kernel.org/all/20210621123714.GA3286648@bjorn-Precision-5520/

Bjorn, suggested that it would be really good if we could have a test
fixture for debugging/testing resource assignment. 

The patch attached along with the cover letter is an attempt to lay the
foundation and also have a proof of concept to show that it is possible 
to have a test fixture to debug the resource assignment code.

Since there are a lot of things which happens during the resource
assignement phase, the first version only tests the __pci_read_base()
function since that was the most easiest to set up.

Hopefully, in the future patches I'll be able to write more KUnit tests
for the other parts responsible during the resource assignment phase and
get closer to the goal of having a complete test fixtures :)

Thanks,
Naveen

Changelog
=========
v4:
    - Fix datatypes of the global variables and the fields of data
      structures.
    - Fix code formatting
v3:
    - Rename init_registers to init_test_registers 
v2:
    - Add test cases to test resource assignment for Type 1 devices
    - Fix a error (a function was not static) found by Kernel Test Robot

Naveen Naidu (1):
  [PATCH v4 1/1] PCI: Add KUnit tests for __pci_read_base()

 drivers/pci/Kconfig              |   4 +
 drivers/pci/Makefile             |   3 +
 drivers/pci/pci-read-base-test.c | 795 +++++++++++++++++++++++++++++++
 3 files changed, 802 insertions(+)
 create mode 100644 drivers/pci/pci-read-base-test.c

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
