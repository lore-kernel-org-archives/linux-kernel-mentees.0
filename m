Return-Path: <SRS0=MxuE=4T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E841C3F2D1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Mar 2020 18:32:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B40124677
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Mar 2020 18:32:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HH2keU2d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B40124677
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 04E8B1FFFF;
	Mon,  2 Mar 2020 18:32:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0GyywNCVtNQd; Mon,  2 Mar 2020 18:32:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 62A4E1FE32;
	Mon,  2 Mar 2020 18:32:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F15DC07FE;
	Mon,  2 Mar 2020 18:32:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6E4BC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 18:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D553484E0C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 18:32:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lyaLoCGTOaPT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 18:32:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5CBC784D16
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 18:32:06 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id o5so139863pjs.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Mar 2020 10:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0dlUWrrxGVbo8SmkPvRn4Zf/awc4GBKqMK3utL1xud0=;
 b=HH2keU2dvU+0B47EQMgF/EsH+A4fh5zWT/BxUT6/tUqSlnQ/fkWDW5ukS5IT5IVm7S
 zhtTH3nZlItKMXf6tyQ/SVDUiq2Eo8DhOMSmBkdkiQt/jQMKdyUSv7rp9cG0XJTqhEoE
 Rk7UWR1GfKdd9i3OP6Xe3w3CKioPAVu1dHfwnG1YlIo6Q4F/APGcv0LaDZYJU+9Sk0pf
 COn7W/fU2XDC6e+J8ePcDRJ7JnTdgGQuSAiceV0KnwOwSXh2CtGWYqDtAoI72gVtN48l
 69wdNeVX/xFGnKbGbfqb/AezVZutwKPkp5muugsLVYbx2IT2ighCKxkQ1LWWk4TnD04s
 FX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0dlUWrrxGVbo8SmkPvRn4Zf/awc4GBKqMK3utL1xud0=;
 b=st1oqZ3LtP6BqrxpM9JuXq7p8qAlJ+j1H0QjWbTExWzqSiPOATIetQ00MD0Ox3+2Yc
 +gsnWoRGyg0jcYbQBbiQm9iSmO927yj8izbKGUX+sryVoOMALUCL2D4L5QIICfgoLBdY
 rJFjSQrn8eZNl+24YZx/Pogq2jvp+0XC1CspbrrbBgCO6knqLaNOuFYz4o2OYwAYu1uH
 Y0+XAds7HGc/6Vv1uxun/FozEyFDxMyaXVkvxbZwpy+doLtahdbPL8HPQyfyEleC2yVG
 H3r5YThG6M9/mFwkQ2CdDzLIP7TckoQeIgZ0ncJF/pN04V+GboUf2LS6ZtVzHBMCZ6IA
 Oqfg==
X-Gm-Message-State: ANhLgQ3m7OONKXVQEwr+Sa1NDIwbHZeDaiVPU6HYJmlus0vcbW6dXNTU
 xO4ZYx4B8X9brpfRhqhUVB8=
X-Google-Smtp-Source: ADFU+vtH0oXhjTF9jRR8Zp7mxCpWPabhmAdSYWB4x8/SP/8jQpSD/AUYV277LKqnORmB0s2qYIc8VA==
X-Received: by 2002:a17:902:14b:: with SMTP id 69mr318072plb.121.1583173925861; 
 Mon, 02 Mar 2020 10:32:05 -0800 (PST)
Received: from localhost.localdomain ([2405:204:800a:15c3:b0b0:78ba:d728:349e])
 by smtp.gmail.com with ESMTPSA id r145sm22508484pfr.5.2020.03.02.10.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 10:32:05 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: corbet@lwn.net
Date: Tue,  3 Mar 2020 00:01:03 +0530
Message-Id: <20200302183105.27628-1-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200302104501.0f9987bb@lwn.net>
References: <20200302104501.0f9987bb@lwn.net>
Cc: Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 0/2] Documentation: Add files to
	driver-api manual
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This patchset adds following two rst files under
Documentation/driver-api and references these both in Sphinx TOC Tree in
Documentation/driver-api/index.rst
 -io-mapping.rst
 -io_ordering.rst

v2: 
 -Provide more descriptive subject lines
 -The document did not belong to top level so moved it to driver-api
  manual

Pragat Pandya (2):
  Documentation: Add io-mapping.rst to driver-api manual
  Documentation: Add io_ordering.rst to driver-api manual

 Documentation/driver-api/index.rst       |  2 +
 Documentation/driver-api/io-mapping.rst  | 97 ++++++++++++++++++++++++
 Documentation/driver-api/io_ordering.rst | 51 +++++++++++++
 3 files changed, 150 insertions(+)
 create mode 100644 Documentation/driver-api/io-mapping.rst
 create mode 100644 Documentation/driver-api/io_ordering.rst

-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
