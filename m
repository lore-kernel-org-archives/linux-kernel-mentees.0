Return-Path: <SRS0=G515=D5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45ACC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 16:14:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EF5324182
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 16:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EF5324182
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8F0EF8783B;
	Thu, 22 Oct 2020 16:14:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k6jkkwj3OGql; Thu, 22 Oct 2020 16:14:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 21CD387736;
	Thu, 22 Oct 2020 16:14:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BD7CC0052;
	Thu, 22 Oct 2020 16:14:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 604BDC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 16:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4F4DC870A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 16:14:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ncD-d07uPjdM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 16:14:50 +0000 (UTC)
X-Greylist: delayed 01:39:45 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0042.hostedemail.com
 [216.40.44.42])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 13AF986E59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 16:14:50 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 27835180A8459;
 Thu, 22 Oct 2020 16:14:48 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: plant29_570b19927252
X-Filterd-Recvd-Size: 1688
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf11.hostedemail.com (Postfix) with ESMTPA;
 Thu, 22 Oct 2020 16:14:47 +0000 (UTC)
Message-ID: <3b706950110fe35c566dd00b684dc426867261e5.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 22 Oct 2020 09:14:45 -0700
In-Reply-To: <CABJPP5AQwRkT_2FozYxgTgUZ2RWS=k1TNN_QOvs6F5se-V-6ow@mail.gmail.com>
References: <20201022145224.645538-1-dwaipayanray1@gmail.com>
 <CABJPP5AQwRkT_2FozYxgTgUZ2RWS=k1TNN_QOvs6F5se-V-6ow@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: extend
 attributes check to handle more patterns
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

On Thu, 2020-10-22 at 20:29 +0530, Dwaipayan Ray wrote:
> On Thu, Oct 22, 2020 at 8:22 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> > It is generally preferred that the macros from
> > include/linux/compiler_attributes.h are used, unless there
> > is a reason not to.
[]
> I am a bit worried about the code size though. Is it better altogether
> to have a shared function for parameterized/non parameterized
> __attribute__ arguments? Might have to categorize the macros then.
> 
> What do you think is better?

I think A single shared mechanism better and more extensible.

Renaming all the code types from PREFER_<FOO> to something else
like PREFER_DEFINED_ATTRIBUTE_MACRO would be OK.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
