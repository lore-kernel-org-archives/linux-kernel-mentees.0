Return-Path: <SRS0=w7vp=DN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B70C4727D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 20:11:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E19112083B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 20:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E19112083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8F2A38454F;
	Tue,  6 Oct 2020 20:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MTQJqXtVD46e; Tue,  6 Oct 2020 20:11:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EC2D884520;
	Tue,  6 Oct 2020 20:11:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D70B6C07FF;
	Tue,  6 Oct 2020 20:11:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B378DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 20:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9EF2F2094C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 20:11:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8UpPFTymvvVi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 20:11:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0169.hostedemail.com
 [216.40.44.169])
 by silver.osuosl.org (Postfix) with ESMTPS id CD56D207B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 20:11:33 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id DF49F1730844;
 Tue,  6 Oct 2020 20:11:32 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: bait96_5d0530f271c9
X-Filterd-Recvd-Size: 1284
Received: from XPS-9350 (unknown [172.58.35.183])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Tue,  6 Oct 2020 20:11:31 +0000 (UTC)
Message-ID: <4f7c452ff57c30225f4cb3f4f81a4303bb6be33d.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 06 Oct 2020 13:11:29 -0700
In-Reply-To: <cd8fb6742e4776a98412278815fc86b568820b6e.camel@perches.com>
References: <20201006185114.168358-1-dwaipayanray1@gmail.com>
 <8553d6679f97ae9d285a9ffd61198f5e3c11dc35.camel@perches.com>
 <CABJPP5Awe=CDC7riYBBVDf9WRO4aAMXK2QROYdtGyJXNjqB-ew@mail.gmail.com>
 <cd8fb6742e4776a98412278815fc86b568820b6e.camel@perches.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: add new warnings
 to author signoff checks.
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

On Tue, 2020-10-06 at 13:09 -0700, Joe Perches wrote:
> I suggest adding it to this patch.

as a --strict CHK as it's not an actual defect in addressing
just a trivial difference in formatting.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
