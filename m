Return-Path: <SRS0=ZZOl=GR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3414C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jan 2021 07:35:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BFB8238EC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jan 2021 07:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BFB8238EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9309B86B22;
	Thu, 14 Jan 2021 07:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ej1h9R4VCS1r; Thu, 14 Jan 2021 07:35:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 888578680E;
	Thu, 14 Jan 2021 07:35:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60CC6C088B;
	Thu, 14 Jan 2021 07:35:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3BE1C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 07:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 92EA986B22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 07:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FzvbedVPSakw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 07:35:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 157598680E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 07:35:24 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id t6so2492280plq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jan 2021 23:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=w8R51QsrEKDLwADFp2JX2ohNQRA7wXsnzFQpBQunQhU=;
 b=cZqclifFJtPeQhDZPhpEEJ67qPONAeZqsxzJ7IEigeCotI3xy/DfkkfjLL4jx8N8VP
 Z9UmvIyKDymt2SFDMo5QUdqkpUUTIUatXKwOR9eZeWdhk8/lCcLtCH/9IZM0sO0VSB4O
 H126G7x1Xsdj2jO4fTSzf7ux3/bsU8PnvV5QrCRT4focInfezml69jwo1vPrciruoyog
 iexyJYD2ZQ52IDf+K7JxDc6qLy8kkmQ/TplNKfi5fd+jPYiLY2urWvzMDDsTGegvKpda
 SLwtxO15rr188Be3QZo2oSkBjPtD1SRekfFurLlSIeXXmz892bqBF/vJcYkq+6iRakwc
 NvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=w8R51QsrEKDLwADFp2JX2ohNQRA7wXsnzFQpBQunQhU=;
 b=f4ZReRhIrAed+b3EY10zVLp2T3Mjtlvby5Zg8qr5nFzcTmuV0bL3imahkPmc3gH/Vf
 Sdu9+dA0WCPg9RFH2CFMngQFhtgNMmUyOX2y/+uHG/dIJDQ/6BWA+cFiwP+Xr5xbw7YX
 uvj/IJ9OD/8Zw9mEZ0TCYqIFpYCqH29lbVgYiU//a/jVuuYl4CAekz53nE9DMqsXjIjS
 EPST1CitFRafhTp6hJk7FyJtGNci4iE7xV5sMMKjSUA53PHJOrvHJavVlkNRr2daxtcr
 A45nLz6X7sEZ2/IWH82/QL4frr8T2khNGNyKr/g50XXfxCO4WXzexfQmTcTPJPquoLWt
 AxMg==
X-Gm-Message-State: AOAM533dZsd6YXuDW+2lqGJKQdXux3xNXG1sV5luXfJhtmME0QvSb/Kw
 af/rdRjmmMr+XvVumg7J2T4=
X-Google-Smtp-Source: ABdhPJzsLz0g/qR3luGSVxu7dmwLn48wdBRdEtAk6zNvG1HXh/Br0U0lCD5PArX3xGq2z9Y678Me/Q==
X-Received: by 2002:a17:90b:3805:: with SMTP id
 mq5mr3671543pjb.93.1610609723619; 
 Wed, 13 Jan 2021 23:35:23 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:b1fd:acc0:2bb9:df96])
 by smtp.googlemail.com with ESMTPSA id x20sm4442145pfc.3.2021.01.13.23.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 23:35:23 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Thu, 14 Jan 2021 13:05:11 +0530
Message-Id: <20210114073513.15773-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <84492ae9-7452-d296-49ab-4d37eed3b968@gmail.com>
References: <84492ae9-7452-d296-49ab-4d37eed3b968@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v3 0/2] checkpatch: fix false
	positive for COMMIT_LOG_LONG_LINE and provide fix
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

Currently, checkpatch gives COMMIT_LOG_LONG_LINE warning even for URL
lines, which should be avoided.

An evaluation over v5.6..v5.8 found that out of 1703 warnings reported
by this class, 161 are due to the line containg URLs. Out of these 161,
53 are due to lines where URL is the first non-whitespace character of
the line.

Fix this false positive by suggesting to prefix the URL with "Link:".
Also provide the fix option to the user.

* Applies perfectly on next-20210108

Changes in v2:
- Fix coding style ('} else {')
- Make the URL check follow RFC 3986 style
- Give warning only if the URL is first non-whitespace of the line
- Set $commit_log_long_line only for else case
- Fix the warning count with exact figures and according to first non-space char as URL

Changes in v3:
- Provide fix option for the warning
- Update the warning count with v5.6..v5.8
- Update regex with /^\s*[a-z][\w\.\+\-]*:\/\/\S+/i (earlier:  /^\s*\b[a-z][\w\.\+\-]*:\/\/\S+/i)

Aditya Srivastava (2):
  checkpatch: fix false positive for COMMIT_LOG_LONG_LINE with URLs
  checkpatch: add fix option for COMMIT_LOG_LONG_LINE with URLs

 scripts/checkpatch.pl | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
