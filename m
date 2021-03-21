Return-Path: <SRS0=OT4g=IT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF205C433C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Mar 2021 17:32:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE5EE61930
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Mar 2021 17:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE5EE61930
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD42E83560;
	Sun, 21 Mar 2021 17:32:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TQYY7Js7mSP0; Sun, 21 Mar 2021 17:32:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4E6B8354D;
	Sun, 21 Mar 2021 17:32:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C110FC000A;
	Sun, 21 Mar 2021 17:32:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D0E8C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Mar 2021 17:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B27E605E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Mar 2021 17:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Improper folded header field made up
 entirely of whitespace (char 20 hex): X-Spam-Report: ...that system
 for details.  Content previ[...]
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ALvBj5_q2Uv8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Mar 2021 17:31:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0DA8605D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Mar 2021 17:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:References:
 Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Rj8WpwRk4oq0rfTiGxdtQAbZTUsGNGnH6FA1//XmoNA=; b=ZCuoOaCcBbKZ4sfRkHPnVzfd0b
 9a51K7c9A2cVylQPKpCLx/ZL3yN8q/BjPRkftoCpE9iTinUjAvppeLqeD1XJA3PD9EvfRlwpYIQXi
 oUXOonQkG5CMMeqpFhXd/m8HHtkV8k+7I+5avLMQfgihg+uYLNzngCPeloTMaO8HPYHo4gfjPrjlB
 4WUhC9fKnVr/dtKY2KKkVF/iFEvANMG8ADvIsU0esexYUdOwkQtBwn5AAzd1iK/CkxJE/HbVt8/C6
 HM44657IfyVcVaq4fH+olN9jO70VhAMiB4lhxnyQli9JExHxvN9440Trm864N61d97b2exVLqEcZy
 doH1BKHA==;
Received: from rdunlap (helo=localhost)
 by bombadil.infradead.org with local-esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lO1vf-002QNq-GW; Sun, 21 Mar 2021 17:31:56 +0000
Date: Sun, 21 Mar 2021 10:31:55 -0700 (PDT)
From: Randy Dunlap <rdunlap@infradead.org>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [PATCH] crypto: amcc: fix incorrect kernel-doc comment syntax
 in files
In-Reply-To: <20210321120832.12837-1-yashsri421@gmail.com>
Message-ID: <7ef98c7-b028-d9ca-88b3-dc4f282effcf@infradead.org>
References: <20210321120832.12837-1-yashsri421@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210321_103155_570995_721D9626 
X-CRM114-Status: UNSURE (   1.76  )
X-CRM114-Notice: Please train this message.
Cc: herbert@gondor.apana.org.au, corbet@lwn.net, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


Looks good. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
