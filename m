Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6799B2877D6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 15:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759506732; cv=none; b=pC5RBUnTZG1ovclQk9hIEhy7fl/IFxuTRxwlClW2pwiPHO7COCoh707fMNVoEQf92P+yrAKy06vDNdpXz5dFlVs24eSQ8AxnwIvl1ZNzB5bxpZysE+8WvsboiY33u40nsjmYdUqnHXkykDB1jj9/lBDTfdtrklPRTXrC0NTOe20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759506732; c=relaxed/simple;
	bh=3W/B7yr0TP3RVj4O6JgUMcihRtNr2fM0e+nfFmSLnXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6QsXF21ATc5Kv7NoRcCnbPP3T+hxGb5WGKgMkQaLN1OaRwtJYEvLIq8LcacSVMUAASD9yAcB1Jr79roAqvBBXXqCX+fQGdyHsqAGhnDGjp+PkKRcwXyTtOT8vC/GeXHSDxGElP+DwiouafHHIyWqY01r9qXDl+82B5UqbEgUf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qYnpt0QV; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYnpt0QV"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BAAE611FB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 15:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d6V8Gkwz58o4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Oct 2025 15:52:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=cem@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 68AB0611AE
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68AB0611AE
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qYnpt0QV
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 68AB0611AE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 15:52:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 541E544800;
	Fri,  3 Oct 2025 15:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46554C4CEF5;
	Fri,  3 Oct 2025 15:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759506729;
	bh=3W/B7yr0TP3RVj4O6JgUMcihRtNr2fM0e+nfFmSLnXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qYnpt0QV5dqgLdyy9PKpBnNSjoro13pjU+CPLy07ZjCKa3R8O/jTQRHcaIiYBSBVH
	 jD+vAmjrrSJHDPvCJbhWx+XG4yS83yJBkdsdTFgei9gjhk5LRo+UlOp8CumBhxqaWC
	 uQUugl61rwN9rRZewNfSfpTan81MgLGlTVlEUN1g3rgPVm+8zIY2ApNOvm9xkmdyql
	 /UPcVqcoaG6Vs1GKV5rzz0fCMiXyi076gtR6C72ocwe+PnQ802jREblO1zvHFWcQLg
	 oIN9jxxGqCNZv0wecr9ZkqvcYVDuKY7QbVzRHl+ZHpOq4Xl5T57PQYCLkMP4kRnVbf
	 o820Zofzfigtg==
Date: Fri, 3 Oct 2025 17:52:01 +0200
From: Carlos Maiolino <cem@kernel.org>
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, 
	Jonathan Corbet <corbet@lwn.net>, David Howells <dhowells@redhat.com>, 
	Paulo Alcantara <pc@manguebit.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-bcachefs@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, 
	netfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Subject: Re: [PATCH] fs: doc: Fix typos
Message-ID: <6t4scagcatuba7hjy4aib5hqfgyhc4wofegr2jrl34wwa7fsyq@5uwpzmpixm7o>
References: <DrG_H24-pk-ha8vkOEHoZYVXyMFA60c_g4l7cZX4Z7lnKQIM4FjdI_qS-UIpFxa-t7T_JDAOSqKjew7M0wmYYw==@protonmail.internalid>
 <20251001083931.44528-1-bhanuseshukumar@gmail.com>
 <kp4tzf7hvtorldoktxelrvway6w4v4idmu5q3egeaacs7eg2tz@dovkk323ir3b>
 <yms8llJZQiWYVxnbeWEQJ0B_S6JRxR0LQKB1FwVe0Tw66ezuA-H1qZVCyuCUDtsw7s7h4jHTwTh98XivLW3vvw==@protonmail.internalid>
 <425ef7bd-011c-4b05-99fe-2b0e3313c3ce@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <425ef7bd-011c-4b05-99fe-2b0e3313c3ce@gmail.com>

On Wed, Oct 01, 2025 at 07:19:13PM +0530, Bhanu Seshu Kumar Valluri wrote:
> On 01/10/25 17:32, Carlos Maiolino wrote:
> > On Wed, Oct 01, 2025 at 02:09:31PM +0530, Bhanu Seshu Kumar Valluri wrote:
> >> Fix typos in doc comments
> >>
> >> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> >
> > Perhaps would be better to split this into subsystem-specific patches?
> >
> > This probably needs to be re-sent anyway as bcachefs was removed from
> > mainline.
> >
> I just did a google search and understood about frozen state of bcachefs
> in linux kernel since 6.17 release onward. It is going to be maintained
> externally.
> 
> Thanks for your comment. I will resend the patch excluding bcachefs.

It's not only bcachefs. But most of subsystems and documents you touch
have different maintainers, so beyond removing bcachefs bits, I'd
suggest looking at MAINTAINERS file and send specific patches targeting
each subsystem. It makes maintainer's lives easier, at least for me.


> 
> Thanks.
> 
> 
