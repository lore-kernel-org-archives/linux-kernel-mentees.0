Received: from relay2-c.mailbaby.net (relay2-c.mailbaby.net [66.45.233.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A857233065C
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  8 Jun 2026 16:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.45.233.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780937753; cv=none; b=q/nzZra5MC2BGxdCpPz+13wZG85o+ym5Ldps1R7iBT+o92T8FxZ7suLjZqGZMYKN2zbJEx5AumZSswkKa3e78zdn4/oQfl08hk8bsQPkrvqMdJNA5fKSThMBGZg2nl7iEQSnWkL3wGw7LffWxAuIRq+o46gy66Lu5aFD6fPmnVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780937753; c=relaxed/simple;
	bh=L5/SBOiO75Cs6ho4pENCPa17vUWEX4bhW0M0fn22V6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kt2W4ASyxApCd0h6jbje14yASTYt9hsmyPiO09Wr1kN0vGLeRoq9NUq9G1mfYoo0QWStozSSLc5sRK+NDIGiR9wHEJgy6k5TxK1u2rVPpeEacCZPIUkqjLHHWy29WSBLcJxKyDEbGlAaP15pog1LqgnniS2+4d5MH58iJvJnRVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=agatha.dev; spf=pass smtp.mailfrom=agatha.dev; dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b=WL+zAlrr; dkim=pass (2048-bit key) header.d=agatha.dev header.i=@agatha.dev header.b=1HendbYt; arc=none smtp.client-ip=66.45.233.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=agatha.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=agatha.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b="WL+zAlrr";
	dkim=pass (2048-bit key) header.d=agatha.dev header.i=@agatha.dev header.b="1HendbYt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbaby.net;
 q=dns/txt; s=bambino; bh=gVIQ+k8iJa52fRCkV6mhf3zPY768WajCu2RXnhW/a5U=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=WL+zAlrrP32+Bk272el5e6E1dC8zLtyLmvtQrwYrX0aW0xA/rTojuqRyiWZNt1FWDy+pk/tm8
 hQUy1G+w/eIPcybVa6ghXX9H6ys0E+MiL+OHjSyIhO0qBeIQNF2fZ1qcMBl4bscz2X5DYINGrrJ
 r99eqXkm9EFUSuKW5ZGONLk=
Received: from mb-nj-kvm1.internal (mb-nj-kvm1.internal [10.10.2.10])
 (Authenticated sender: mb6724)
 by relay2-c.mailbaby.net (MailBabyMTA) with ESMTPSA id 19ea8249852000504b.002
 for <linux-kernel-mentees@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 08 Jun 2026 16:50:31 +0000
X-Zone-Loop: 735b9c66816abfbe3e7aa78fcae5995c0037cef128b2
X-MB-ID: mb6724|me@agatha.dev
X-SPF: pass
Feedback-ID: mb6724:19ea82:507c5a5c5e5d585f7d5a5951:mbaby
X-MAILBABY-ORIGIN: PASS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=agatha.dev;
	s=default; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=gVIQ+k8iJa52fRCkV6mhf3zPY768WajCu2RXnhW/a5U=; b=1HendbYtYOLxR/tAYXtk8ZeCtq
	d/NAeycueCVjAj/ASs94ubFYZryM5z6wobur5w9pKIaQ53e/MEa2voeiI8ZOs2TDp8bQ0687mbK0T
	6uTzLj6HEDKtYYzKLZy3X8F9u53pFJEygBw08bD6zVizPYBLrEe5xIWPUQX0Iot9vtjzGRPerSyrH
	a+BNn96F3t72rwxzJfa9xRSnOVXF5zDZPU717cCxKch5TBYNWtLRYHtLEXfntUguWJhDp+kWjyAy1
	M7yi5tSG3Yy54hPR/BSWskFV+Fnn2cVoZN/W9+YiqXHOLlrEHDeJRLSkfhPfu5J/MSRWmumokZvg8
	yuvsI8+A==;
Received: from [170.254.153.168] (port=37689 helo=guidai)
	by nyc3000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <code@agatha.dev>)
	id 1wWdBG-00000008Zv4-2OoW;
	Mon, 08 Jun 2026 12:50:30 -0400
Date: Mon, 8 Jun 2026 13:50:19 -0300
From: Agatha Isabelle Moreira <code@agatha.dev>
To: Joe Perches <joe@perches.com>
Cc: Manuel Ebner <manuelebner@mailbox.org>, 
	open list <linux-kernel@vger.kernel.org>, kernelnewbies <kernelnewbies@kernelnewbies.org>, 
	mentees <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH] get_maintainer: add recipients to output of script
Message-ID: <aibyVCSoeqh49ZzC@guidai>
References: <20260608152242.61223-2-manuelebner@mailbox.org>
 <14198ef7adde6d0e24535edf64266201b7036fed.camel@perches.com>
 <85761322b578c87381553baf479491a55a5b8b24.camel@mailbox.org>
 <df0a4e75dc79b874b0e20fc5e153e2a22b2cf9f3.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df0a4e75dc79b874b0e20fc5e153e2a22b2cf9f3.camel@perches.com>
X-AuthUser: me@agatha.dev

On Mon, Jun 08, 2026 at 08:52:00AM -0700, Joe Perches wrote:
> On Mon, 2026-06-08 at 17:46 +0200, Manuel Ebner wrote:
> > On Mon, 2026-06-08 at 08:29 -0700, Joe Perches wrote:
> > On Mon, 2026-06-08 at 17:22 +0200, Manuel Ebner wrote:
> > Add all people tagged in all the mentioned commits to the output of this script.
> > > Why?
> > 
> > Because sometimes there is a reason to add them. Doing so with get_maintainer
> > spares the manual copying and pasting.
> 
> Please specify this reason in the changelog.
> 

Is the original message outside the kernelnewbies list?

I do not see the original message in the kernelnewbies list, and neither
I see Manuel's messages, so I'm lacking context here.

-- 
Agatha Isabelle Moreira
C Developer | agatha.dev
Sourcehut: https://sr.ht/~devlavender/
