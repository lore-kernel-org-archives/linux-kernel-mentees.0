Return-Path: <SRS0=pD5R=3O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA0EC2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Jan 2020 15:01:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C96E720704
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Jan 2020 15:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C96E720704
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7EBC8875EB;
	Sat, 25 Jan 2020 15:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u46wEWOFQBUD; Sat, 25 Jan 2020 15:01:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9B1D48735E;
	Sat, 25 Jan 2020 15:01:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D787C1D80;
	Sat, 25 Jan 2020 15:01:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49302C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jan 2020 15:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 329AD86640
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jan 2020 15:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7aOUUCVacmfs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jan 2020 15:01:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 627A686205
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jan 2020 15:01:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,361,1574118000"; d="scan'208";a="336998798"
Received: from ip-241.net-89-2-7.rev.numericable.fr (HELO hadrien)
 ([89.2.7.241])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jan 2020 16:01:29 +0100
Date: Sat, 25 Jan 2020 16:01:28 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200121122458.5513-1-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2001251601130.3236@hadrien>
References: <20200121080455.24748-1-jaskaransingh7654321@gmail.com>
 <20200121122458.5513-1-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH v3 0/3] cocci: Improve management
 of macros before typedefs
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



On Tue, 21 Jan 2020, Jaskaran Singh wrote:

> This patch series is for improving the management of the following
> case:
>
> <macro> <typedef> <ident>
>
> If <typedef> is a known typedef (such as u8 or *_t) then label <macro> as a
> CppMacro. Subsequent cases will continue to label <typedef> correctly as a
> typedef identifier.
>
> Also add bool to the list of known typedefs so that cases of
>
> <macro> bool <ident>
>
> are handled correctly just like any known typedef will be.
>
> Changes in v3:
> --------------
> - Change "subsequent cases will label" to "subsequent cases will continue to
>   label" in commit messages of Patch 0/3 and Patch 1/3.
> - Change the term "typedef ident" to "typedef identifier" wherever
>   suitable.
> - Add metavariable symbol false to tests/macro_before_bool.cocci to
>   suppress warning.
>
> Changes in v2:
> --------------
> - Group these patches as a series for clarity
> - Add a test case for <macro> bool <ident> (Patch 3/3)
> - Explain what has been improved with Patch 2/3

All applied.  Thanks!

julia

>
>  parsing_c/parsing_hacks.ml    |   37 ++++++++++++++++++++++++++++++++++++-
>  tests/macro_before_bool.c     |    4 ++++
>  tests/macro_before_bool.cocci |   10 ++++++++++
>  tests/macro_before_bool.res   |    5 +++++
>  4 files changed, 55 insertions(+), 1 deletion(-)
>
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
