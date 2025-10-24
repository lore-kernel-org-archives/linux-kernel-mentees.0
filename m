Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EC730E825
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Oct 2025 23:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761349273; cv=none; b=UEZ6XLyYh6CIZH33WV7mAh4TGngpMtyA2fodDstuCy3Wqm5l3yQuOuGPPGommR3JFYMJIo4qp/1Aq3nhKm/ljq1y9DeOR+V2GcuTGTwN2BwhGCxJWB9agPOa8Sh2OA54FHpbKEYKt7yOyh5hmgZCXa7DnXzlAsUSnZSeBEf1CzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761349273; c=relaxed/simple;
	bh=RQ+P8SMlyqo8hABnaUbg3wswyJmqjmY4tNo23Qzdr2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugfZ3Fv90ghqgyU1GRwBHOhpfQv6LBsXrw4jd2DGo1GnwhOWzd4GCgOHWOo802gXXZtSupZZawNHmsc/qR4yWkDeyZztaJNWxZ7ia41FzEQgnmnVRhr9ARD8qbX7oA8xserd//gf7UxYUIVTmlLLIpVakD/g9NNYKXrTHXacb/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=t0NEEPa7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QtzYw3/Y; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="t0NEEPa7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QtzYw3/Y"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 434198235A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Oct 2025 23:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -6.494
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GS6Kqeg0bWJT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Oct 2025 23:41:09 +0000 (UTC)
X-Greylist: delayed 397 seconds by postgrey-1.37 at util1.osuosl.org; Fri, 24 Oct 2025 23:41:09 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0EABC82355
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EABC82355
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=t0NEEPa7;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QtzYw3/Y
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.151; helo=fout-a8-smtp.messagingengine.com; envelope-from=o-takashi@sakamocchi.jp; receiver=<UNKNOWN> 
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0EABC82355
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Oct 2025 23:41:08 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 9A358EC0192;
	Fri, 24 Oct 2025 19:34:31 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 24 Oct 2025 19:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1761348871; x=
	1761435271; bh=v72nELjMtMmlTac0SNMjedDOXnAusqzAOhY+MbmwKnw=; b=t
	0NEEPa7H9nMyWBIBxTBOniaiffMrH6W/qkU+W2MUo+NouoLliehhhhZo9ctGa7U4
	V8Kt38m2STTu1dMnfVs1EtU1dKIvBj+qDNbNL0XfUFNzZGM3yTjJhMCzIDer8wC6
	9028D8cwT5cBZJu/aMfBGT9F9+KDiAxZWZHvTxK254jUitrkFZ2pbibi+Ry6L74l
	ROFAjCO0H+wsT3p1pR/gUh/z6mW+XFgWa4dfoTAJobU5vKePt8koiO1r+PZINd9d
	/oTDS7qyqO31E7Mrx3gtT+PtTJT6G2lmrXFRX1//wpYnOXJ7S5mmZZZ0lRDu8qrN
	Ds1fXmR4K1zi3p1y6HdjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1761348871; x=1761435271; bh=v72nELjMtMmlTac0SNMjedDOXnAusqzAOhY
	+MbmwKnw=; b=QtzYw3/YOTczXtIqg7oxzfmWDqe8+zAhclezionFY0vkrXYAZEd
	x0ODpsXSmqC7z0RNiflLkYAJ0zU9f/Ainh6JV8ufBTDIlRmqPhKhqUCOxGVGKtkF
	GiJH9QJs+v43igA7ZhOXRR3eqyaccv+ZPwULvAcyMhAthQk8ya9HUI81NTBzHLBt
	kFS3bNdgIaptbNfzqIR/Ic9sroIp6mYVBqrrL8hgTkRHHzM7+oxQD+3K0nlbCbeJ
	Pfp2WkBxSdfiC5iubL/zdi3Rdg2mQW6OClghUpnnR5luWYAqUswH5ZdmEI+rfJQN
	GbkC6RGHrhu7I/PltYREyGDVX++AqqffGtg==
X-ME-Sender: <xms:Bw38aFOFwOBwowpX9GBbrbD4mFUU8T7xmi6iQ_LJKbt734bzXHuhNQ>
    <xme:Bw38aC51dRvz_J0KwrQZIz_wotJEbVEoRT4NLgkL2HxPGKFVP6wN8ZBToNE55BLEg
    A-ygyQTRLwimOdIU_wOymm_-y8EFHlh5ZTY4qpPjjgJtwSPuEvu0zU>
X-ME-Received: <xmr:Bw38aDSvujDdQ1CyP3zKrTmqebnVY3ZQCeoMfpuF986F2QCrtZEquOY1JQX04QJ0SujPaS1riuIAf964OypG1XusKjXGz5L7tfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduhedtieejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:Bw38aHBVoxPdgtPAkgqXmJxVrpvPySDI7s9Dcd97EStQ0eFWAZKIUQ>
    <xmx:Bw38aLHc0elDvUOc4eXrQ32CSjKHMMJDn7z33xERKTuTAOkaY8oEVw>
    <xmx:Bw38aJBrfZpfTVRr6yDdSYreEssnFwTMo_bTVT7M-9ii8mUM2fPXlA>
    <xmx:Bw38aLUAf8YXY8DktkJ4IxMEDRl2hA4cOm_M6Omy6TiJE7N_W87Xlw>
    <xmx:Bw38aPE_pLnMG3_Y8_M0-2ugjrdv4vIDePj38E3nFZnn9KJGjX38y9hv>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Oct 2025 19:34:29 -0400 (EDT)
Date: Sat, 25 Oct 2025 08:34:27 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Nirbhay Sharma <nirbhay.lkd@gmail.com>
Cc: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] firewire: init_ohci1394_dma: add missing function
 parameter documentation
Message-ID: <20251024233427.GB463024@workstation.local>
Mail-Followup-To: Nirbhay Sharma <nirbhay.lkd@gmail.com>,
	linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
References: <20251024203219.101990-2-nirbhay.lkd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024203219.101990-2-nirbhay.lkd@gmail.com>

On Sat, Oct 25, 2025 at 02:02:19AM +0530, Nirbhay Sharma wrote:
> Add missing kernel-doc parameter descriptions for five functions
> in init_ohci1394_dma.c to fix documentation warnings when building
> with W=1.
> 
> This patch addresses the following warnings:
> - init_ohci1394_wait_for_busresets: missing @ohci description
> - init_ohci1394_enable_physical_dma: missing @ohci description
> - init_ohci1394_reset_and_init_dma: missing @ohci description
> - init_ohci1394_controller: missing @num, @slot, @func descriptions
> - setup_ohci1394_dma: missing @opt description
> 
> Tested with GCC 13.2.0 and W=1 flag. All documentation warnings
> for these functions have been resolved.
> 
> Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
> ---
>  drivers/firewire/init_ohci1394_dma.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied to for-linus branch.


Thanks

Takashi Sakamoto
