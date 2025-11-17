Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB89B15855E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Nov 2025 11:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379078; cv=none; b=Ot/79sIXuFeLvU4xwm1KZn9K3RHWXGDyUP6Yaw7K1jwFDVNFaX4koH30aHQ/9q1tFnH7UQRYoJA5uOk0WFKuWKdrv+Z01Z03s3Zd5q5Q8P98IchBMpXuuMN7HbQCaeU+aYnmNSRjetkacTaPQgwDLF0vS4O1cOt93RnMqUQxW7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379078; c=relaxed/simple;
	bh=ghOn5aauEkpeyknxTL4CgQV3cP6rV0xcInBs2JfaoUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDCye0zjDykxba5I/ty/FN+FpjhVZYX9R+I8bbvvcbAYtIZOo09NUjdm1njjjSgv2gdt7m8x8urrxVuf4HFg2vCFZacU2/yUsBEMuzRzNKVRlnhdCC/qFjrZXtSJxEH9T/qnKl57K1t9yUGY0RvH17BMe2/9xDQcd83rhBcnfws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=eNEWDzBp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=v2gdH2dZ; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="eNEWDzBp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="v2gdH2dZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFE998133D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Nov 2025 11:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -6.493
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cy44Lxti-7q1 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Nov 2025 11:31:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.154; helo=fhigh-a3-smtp.messagingengine.com; envelope-from=o-takashi@sakamocchi.jp; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B034812E1
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B034812E1
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=eNEWDzBp;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=v2gdH2dZ
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4B034812E1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Nov 2025 11:31:12 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 08F2214000D3;
	Mon, 17 Nov 2025 06:31:12 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 17 Nov 2025 06:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1763379072; x=
	1763465472; bh=Od/LzLdNDLGB9BaWnjY2NsLBwJgTXzPdpv02meqtZL8=; b=e
	NEWDzBpnsvJT+o5L9OSIk7t0Yy5mfR/78nWkjOS2KKA8ACtwf0Pfg1rX+PuUWTir
	w/XynM07ikaQgWHmUQQe7qOl3EnGboheRXD+kh9lssNb4K4cRy/jQdwooiKVjubz
	9kG9sxbp6SYXAUvBTz+G9+xdV984gRVxWsQ7t8XE6Na+7s//+Gyt+KkBODoCR3xN
	xyCHnYZkERD1T1JLVqG++TETFqGzjVUS6bCJMIIXtiE4UGS3MY5eX1c1whEZqnqo
	v2Nu8xvxqFY09Ac69AAzb5MB/zb0m0qe4XUGE/blEPplvzTvBW9TtrmcZ2OBw/j1
	baDZlVXGI/wm4qk+/ND/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1763379072; x=1763465472; bh=Od/LzLdNDLGB9BaWnjY2NsLBwJgTXzPdpv0
	2meqtZL8=; b=v2gdH2dZGiqIIDuCKd6o30bhBgJ3PaxKZBiFG6jOOAkblHN9b6h
	odKEhqrOBq9SrZgksH6jz7O6NnaNUZuj+WPLOdEIulRotIFJsx4LtnjDqTKqjqC2
	6JdwHsWARYULBXkpI2zx4Nb2tNGfa8KvICCtpMtk9D14VVIA51AJqCoQgjaoaqXE
	8h+GLq4H4LQJbYHYvJ+vmFczgzew2/PDrnhHwv/jtia90czs3xA0qZdGbKZNsRrB
	TO7eRMVNFlIy1WhXfpvOEsjZ8AJAQHSCsjuYzFxq7CjfXVOESaUI3BXTyreoRx4R
	du5oNoHgJxpkywVyEkIK/LaWl/VHUHo0pfw==
X-ME-Sender: <xms:fwcbaY5CVpLu38cVxyEmWKGM3GcMkB4VH_5R54KVYK6HMvchnmjhYQ>
    <xme:fwcbaU0JntyJkiS4rCRYrvqSy3ro2qjlHZpXZpcXQJv4MMrQdUYeqB03WxFnf78Nh
    bZNNSGEg-3_NN7qLFGRU9PyIA8IIbdJtyJuxL0gk67gyOaaUjcsN6bW>
X-ME-Received: <xmr:fwcbaWeaqVLHOWgO4qCEu_kVwmmvZRtosIQKU7BCHWFGXxp4RRgYM915krsdPV671WibykY0pnIjAGPwfeRH7ugUUhvuEUzerg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvudekfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
    hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeehhffhteetgf
    ekvdeiueffveevueeftdelhfejieeitedvleeftdfgfeeuudekueenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
    hkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehnihhrsghhrgihrdhlkhgusehgmhgrihhlrdgtohhmpdhrtghpth
    htoheplhhinhhugidufeelgedquggvvhgvlheslhhishhtshdrshhouhhrtggvfhhorhhg
    vgdrnhgvthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehskhhhrghnsehlihhnuhigfhhouhhnuggrthhiohhn
    rdhorhhgpdhrtghpthhtohepuggrvhhiugdrhhhunhhtvghrrdhlihhnuhigsehgmhgrih
    hlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehl
    ihhsthhsrdhlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:fwcbaSdMsTqGljbocT6Y14kGzu1rpwSXoAelZbH2C4ZQdEeKCXJ1Pg>
    <xmx:fwcbaZxSIDkC371Im2vnrj_R0X0_bIJiJI-vi3-W74Wll2sNGyMB9w>
    <xmx:fwcbaZ_CeluSrNp7ie51PKXhkeU0PS-G-XPMOaCrcnVFbnvFLN2riQ>
    <xmx:fwcbaRiMaNKn5ByvYSigv1uhtsq3GhwQnjcnZSzkqlav4ZOdZCsBAw>
    <xmx:gAcbacS5QX8FKfwJSKjqUVCefai2_gtKpBvOQWVbkUK9h7TtnZegb3B5>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Nov 2025 06:31:09 -0500 (EST)
Date: Mon, 17 Nov 2025 20:31:07 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Nirbhay Sharma <nirbhay.lkd@gmail.com>
Cc: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] firewire: Replace ENOSYS with appropriate error codes
Message-ID: <20251117113107.GA663208@workstation.local>
Mail-Followup-To: Nirbhay Sharma <nirbhay.lkd@gmail.com>,
	linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
References: <20251117110901.686828-1-nirbhay.lkd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117110901.686828-1-nirbhay.lkd@gmail.com>

Hi,

On Mon, Nov 17, 2025 at 04:39:01PM +0530, Nirbhay Sharma wrote:
> ENOSYS is reserved for "invalid syscall number" and should not be used
> for other error conditions. Replace incorrect usages with more
> appropriate error codes:
 
Yes. The newly-written code should not use ENOSYS for cadual use, indeed.

> - In sbp2.c: Use -EOPNOTSUPP for unsupported operation (re-adding
>   logical units via SCSI stack).
> 
> - In ohci.c: Use -EINVAL for invalid ISO context types in switch
>   statements, and -EOPNOTSUPP for unsupported Pinnacle MovieBoard
>   hardware.
> 
> - In core-cdev.c: Use -EACCES for access policy violations when
>   operations are restricted to local nodes' device files.
>
> Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
> ---
>  drivers/firewire/core-cdev.c | 6 +++---
>  drivers/firewire/ohci.c      | 8 ++++----
>  drivers/firewire/sbp2.c      | 2 +-
>  3 files changed, 8 insertions(+), 8 deletions(-)
 
There is a rest to discuss when changing existing code in respect to
this topic, since it brings loss of backward-compatibility to userspace
software. In this reason, I've left them as is.

If there are any strong and specific reasons to correct them, let us
change them. Do you have such reasons? For example, Linux kernel
developer have shared the consensus and decision to ostracize such codes?


Thanks

Takashi Sakamoto
