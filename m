Return-Path: <SRS0=nBaC=E6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F0DC2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Nov 2020 09:55:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83358206FA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Nov 2020 09:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83358206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 03FCF832E1;
	Tue, 24 Nov 2020 09:55:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2dImRD8AOdmn; Tue, 24 Nov 2020 09:55:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 42AA9826AC;
	Tue, 24 Nov 2020 09:55:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37E9CC163C;
	Tue, 24 Nov 2020 09:55:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8EB0C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 09:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CF6DC87017
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 09:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bwQRH7YdiiCC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 09:55:54 +0000 (UTC)
X-Greylist: delayed 02:29:15 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0086.hostedemail.com
 [216.40.44.86])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 100F987009
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 09:55:53 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 02AA2812390F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 07:26:41 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 89429180A7FD7;
 Tue, 24 Nov 2020 07:26:38 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: grape01_14135a62736c
X-Filterd-Recvd-Size: 1629
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf10.hostedemail.com (Postfix) with ESMTPA;
 Tue, 24 Nov 2020 07:26:37 +0000 (UTC)
Message-ID: <8f6f634f3c4e079fd16922f2dd1109f2974319b2.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 23 Nov 2020 23:26:36 -0800
In-Reply-To: <CAKXUXMzcMWeM2M81b2PZ+D54LO6xd+m667vygWVF93Mnsq8QQg@mail.gmail.com>
References: <CAKXUXMx8siSm67jkBP_r+OKyKALfT2EDcX_SfX7JGBy3YisXcQ@mail.gmail.com>
 <20201123172430.12854-1-yashsri421@gmail.com>
 <148208ef84344069a6c95d3f686a86ca1199be90.camel@perches.com>
 <CAKXUXMzcMWeM2M81b2PZ+D54LO6xd+m667vygWVF93Mnsq8QQg@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: add fix and
 improve warning msg for Non-standard signature
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

On Tue, 2020-11-24 at 07:54 +0100, Lukas Bulwahn wrote:
> On Mon, Nov 23, 2020 at 6:33 PM Joe Perches <joe@perches.com> wrote:
[]
> Maybe a patch reduced to the very obvious synonyms helps newcomers or
> people with lousy memory to be reminded that it is called
> "Co-developed-by:" not "Co-authored-by".

I have no issue with proximity matching for nominally invalid uses.
I think the method used wasn't great though.
For trivial spelling defects, levenshtein might work well enough.



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
