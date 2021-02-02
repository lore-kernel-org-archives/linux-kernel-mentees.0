Return-Path: <SRS0=9TgK=HE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4688C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  2 Feb 2021 15:00:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4164064F55
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  2 Feb 2021 15:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4164064F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0371785A76;
	Tue,  2 Feb 2021 15:00:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mItaWDr4_O88; Tue,  2 Feb 2021 15:00:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 90FA485A22;
	Tue,  2 Feb 2021 15:00:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A48BC0FA7;
	Tue,  2 Feb 2021 15:00:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86BDDC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Feb 2021 15:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 727C685A22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Feb 2021 15:00:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Am6gjivh04kW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Feb 2021 15:00:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D5BD885992
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Feb 2021 15:00:40 +0000 (UTC)
IronPort-SDR: NmbdX5rYVYUD4LHIcuSbRGNGkcYn7Lv5/aMcKvZsAVoPD7hp2NhPcFE4a4zjqg29U4fA4VVB4f
 /MBTYqi5kTow==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="181007232"
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; d="scan'208";a="181007232"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 07:00:19 -0800
IronPort-SDR: mbSt7PA53ugGhIMr8RjzPt8QGKyFJ0F7jCGOpI00BEsMiCca7FDw79ce31oS5bKtBKlkzm7pQ/
 Tel10bxwbZTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; d="scan'208";a="413617902"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.159.39])
 by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2021 07:00:17 -0800
Date: Tue, 2 Feb 2021 22:54:45 +0800
From: Philip Li <philip.li@intel.com>
To: Joe Perches <joe@perches.com>
Message-ID: <20210202145445.GA14043@intel.com>
References: <CABJPP5AxB8-kafFEpsMydg8eMx8bH5ooT5g7r0fKWV2T2Hjtng@mail.gmail.com>
 <YBguQ/dENrfvtptJ@kroah.com>
 <CAKXUXMwtXTYfs_9Asnmpd09zsucg8tRehMi2Shv8V49H-rs4xA@mail.gmail.com>
 <CABJPP5Dt6KyoaMr-dS9425rozKoCyiPgx9WfoeY2541Aq3MF=w@mail.gmail.com>
 <d5277573215624098109e888c01f4b10fa917439.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d5277573215624098109e888c01f4b10fa917439.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kbuild test robot <lkp@intel.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Patches from the future - can checkpatch
 help?
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

On Tue, Feb 02, 2021 at 04:48:04AM -0800, Joe Perches wrote:
> On Mon, 2021-02-01 at 22:41 +0530, Dwaipayan Ray wrote:
> > The idea of a bot seems nice though in general.
> > People do have all the style checking scripts at their disposal, but still
> > we see style issues on the list.
> > 
> > Something similar to the kernel test robot, but for style issues seems nice.
> > Is it something the community would like?
> 
> (Adding lkp)
> 
> Maybe yes, but likely it depends on the particular audience so
> no, not really.
> 
> The kbuild test robot used to run checkpatch on patches and there
> there was negative feedback.  I don't know if the robot is still
> running checkpatch with some subset of message types.
Hi Joe, we had disabled the checkpatch due to low fruit with very limited
useful reports. Is there any recommendation like which kind of types can
be interested?

Thanks

> 
> A thread from 2013:
> 
> https://lore.kernel.org/lkml/20130903003958.GA6855@localhost/
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
