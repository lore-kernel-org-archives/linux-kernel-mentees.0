Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4F6C4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 17:49:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71E0A2076E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 17:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71E0A2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cmpwn.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0FB1E84FBB;
	Tue, 10 Nov 2020 17:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ejOMAtthEhys; Tue, 10 Nov 2020 17:49:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3488784BA5;
	Tue, 10 Nov 2020 17:49:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23F28C088B;
	Tue, 10 Nov 2020 17:49:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 659BDC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 17:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 53D9A87257
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 17:49:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6A7JKuqif+4F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 17:49:07 +0000 (UTC)
X-Greylist: delayed 00:08:20 by SQLgrey-1.7.6
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3308987253
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 17:49:07 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmpwn.com; s=key1;
 t=1605030044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=Z9zeRDZ2j+RYvYV/sSKPfJ23GM432ud8SVt0CMnE+Mc=;
 b=ikA/ah51Ygf4ph1diEptsMPmvqAc8dWOy8moZN6IdZk0XWv3rbTfpu2er8ZcEmmMiS4JUY
 qIiVv4SuAnOqlKwThZOKWZi5Nfd36v60fpIRsE+G7mlWqiDzqZaJn4XCKCOxS+VgkXmEge
 QJmOQ+ZKOymLH8xxH3VG3y4/Fr7CtBCVc/1oUnMgra4iXLLQrKX0SnpzxBtntSkFq9NZ4y
 7EEhd08djCLvIQGPwa01TQXuvvF2RybfXIzhZbJ0PDVkxIVyUO2YhFPci2GDMav4UveOYb
 0OeWULgT+3AfQJY5jsKCAmKq7m62hOHq461w71vTWLCAx0aKo1zvPVrYiY+nDw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Drew DeVault" <sir@cmpwn.com>
To: "Aditya Srivastava" <yashsri421@gmail.com>, <corbet@lwn.net>
Date: Tue, 10 Nov 2020 13:40:18 -0400
Message-Id: <C6ZRNNLCPJJS.21CMC9SORJPVR@taiga>
In-Reply-To: <20201110173949.31440-1-yashsri421@gmail.com>
X-Authenticated-User: sir@cmpwn.com
Cc: joe@perches.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] Documentation: include sign
	off for reverts
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

On Tue Nov 10, 2020 at 1:39 PM EDT, Aditya Srivastava wrote:
> using your real name (sorry, no pseudonyms or anonymous contributions.)
> This will be done for you automatically if you use ``git commit -s``.
> +Also reverts should include a Signed-off-by. ``git revert -s`` does
> +that for you.

The language here is a bit odd, try this:

Reverts should also include "Signed-off-by". ``git revert -s`` does that
for you.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
