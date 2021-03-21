Return-Path: <SRS0=OT4g=IT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D398DC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Mar 2021 17:34:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7252761931
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Mar 2021 17:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7252761931
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 434A082EC7;
	Sun, 21 Mar 2021 17:34:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jMRWTsLH4Ko1; Sun, 21 Mar 2021 17:34:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 771CA82F0F;
	Sun, 21 Mar 2021 17:34:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5568FC000A;
	Sun, 21 Mar 2021 17:34:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CECC3C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Mar 2021 17:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9D74605E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Mar 2021 17:34:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Improper folded header field made up
 entirely of whitespace (char 20 hex): X-Spam-Report: ...that system
 for details.  Content previ[...]
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cxZu1KS0rzLa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Mar 2021 17:34:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61F6D605D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Mar 2021 17:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:References:
 Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=b6kxlAh3fIabeLvigmFVk68R8rwvjb2NK7Orm1rRGAo=; b=zoso+9PaOZXk0kOw2FuTs66wdp
 6ZCwzxl4MbPIgWQNj2SM8rozWv5lm+S1GMySmBVrt3b01r9s335TsV8OW/OsXJi8UV6j6PUHUWDwS
 Qw7UVEJstdbnuL++Qz2UpOfUc8m6D6bjSGE4S/MeUMcEMLj/NrrUbwPPzjKRVcln74+eAh+C5kY9j
 r0sOQqvDKR2rkyhueQH9QgNAQTPCjp3xzMUWSsdVY7SqYdU5pEOB8jJx0pY86V4MrIuIpjtZFBW2f
 8H5cgzZw9b9x83VRXdYwwyIFNiexRHx5KyPuRG1EwLkHIG9xM7b9AdewQTr2fSlzE6gVNlCPNo6Dl
 ktoLcXGQ==;
Received: from rdunlap (helo=localhost)
 by bombadil.infradead.org with local-esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lO1xw-002QSK-VC; Sun, 21 Mar 2021 17:34:17 +0000
Date: Sun, 21 Mar 2021 10:34:16 -0700 (PDT)
From: Randy Dunlap <rdunlap@infradead.org>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [PATCH] crypto: nx: fix incorrect kernel-doc comment syntax in
 files
In-Reply-To: <20210321123007.15505-1-yashsri421@gmail.com>
Message-ID: <84443584-2cbf-5945-2b6-b7a057a72540@infradead.org>
References: <20210321123007.15505-1-yashsri421@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210321_103417_013224_F9F210D0 
X-CRM114-Status: UNSURE (   1.45  )
X-CRM114-Notice: Please train this message.
Cc: linuxppc-dev@lists.ozlabs.org, herbert@gondor.apana.org.au, corbet@lwn.net,
 mpe@ellerman.id.au, nayna@linux.ibm.com, linux-kernel@vger.kernel.org,
 pfsmorigo@gmail.com, linux-crypto@vger.kernel.org, benh@kernel.crashing.org,
 leitao@debian.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net, paulus@samba.org
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
