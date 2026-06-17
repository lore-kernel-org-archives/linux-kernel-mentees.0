Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692133803F7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 17 Jun 2026 22:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781735461; cv=none; b=mgbao6VBJ3HlLELe2As8/xGsq2oZk63DPnsiIedayZDe0I81Lc3GXZz8rS8ADkiPxK/llK0PdbQiWcNiYsL/Pmez07yx/yOSZtH640xjThilz4rOYBuS0N074UE2TLfrwQR2jGqKGki2LPAfgCnVurQgewY3qVXHJXRNjfmQC8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781735461; c=relaxed/simple;
	bh=Ix5IqDnIc6LqNbWylW/sj3UnwyPoCxbyCegDUzuVC5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXnZX+82U0VCGs932TmfLk20w58xwEVQD1Z7n6qoBTQNMVP3lAw/tyOLvRIPEs0sxTGURFv8mYLwnw+vA5tQNpIB+Jyp4Ts+OW/32kOxWmFnJP/kgXoyTtczwcOSaYxti0JTo1kHKMzklCI0tSxtbJru4KahCRAJCFjUkMtZH/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3KdhQeJ; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3KdhQeJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EB4A82134
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 17 Jun 2026 22:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G534KrG1yr7H for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Jun 2026 22:30:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7840782133
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7840782133
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J3KdhQeJ
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7840782133
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 17 Jun 2026 22:30:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A1C9340244;
	Wed, 17 Jun 2026 22:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B741F000E9;
	Wed, 17 Jun 2026 22:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781735458;
	bh=E5oop4TgsnZNMoD4GFdU48MAJHaPqsNP5SYe53mN4XI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J3KdhQeJIW3JD4Eb5Wn7WYwq2dcQooTmOMjA9JFDrbW2yZ/Xn/gMqExnzHgw2FOIw
	 qKLvHrG1F3sCTX+dfmsa69odAXCzrAVWVOlpkofK8jIKOiE4djJptXyXXOKXB0T01z
	 ihGVbrYAQf1jmy16T6iImgarvnb+t94VDkr+MnLerdLlOyDoZrl8ii+MQD8+jiGTGZ
	 DPYtChJyMhTGGp3qWZIJovGCY0Y0zUkKvIg8QC3WmW1liResKLp1g5w4ETZl1q/ifa
	 ZpzOCehHaCCG8LjAgRS5zA54PR0mfy18D84AnGnhSHX3YpyiYdim4vebiCeBUestrD
	 c7mVo8LsEPFEg==
Date: Wed, 17 Jun 2026 15:30:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH] modpost: release allocation when early return no suffix
 .o in read_symbols()
Message-ID: <20260617223054.GA3913876@ax162>
References: <20260610052550.187006-1-robertusdchris@gmail.com>
 <178167011232.2064238.5669414796099955471.b4-review@b4>
 <20260617214635.GA4766@soyboi>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617214635.GA4766@soyboi>

Hi Robertus,

On Thu, Jun 18, 2026 at 04:46:35AM +0700, Robertus Diawan Chris wrote:
> On Tue, Jun 16, 2026 at 09:21:52PM -0700, Nathan Chancellor wrote:
> > On Wed, 10 Jun 2026 12:25:50 +0700, Robertus Diawan Chris <robertusdchris@gmail.com> wrote:
> > > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > > index abbcd3fc1394..8e231544f9f3 100644
> > > --- a/scripts/mod/modpost.c
> > > +++ b/scripts/mod/modpost.c
> > > @@ -1585,6 +1585,7 @@ static void read_symbols(const char *modname)
> > >
> > >  	if (!strends(modname, ".o")) {
> > >  		error("%s: filename must be suffixed with .o\n", modname);
> > > +		parse_elf_finish(&info);
> > >  		return;
> > >  	}
> > >
> >
> > Thanks for the patch! While this change appears to be correct, would
> > moving the strends() if block before the parse_elf() one resolve this as
> > well?
> 
> Yes, moving the strends() if block before the parse_elf() also resolve
> this too. The reason I didn't do that because I am still not sure if
> changing the order will have any effect. I already take a look at the
> code and it looks like strends() if block and the parse_elf() didn't
> depends on each other, but just in case I missed something, I decided
> not to change the execution order and just add parse_elf_finish().

Yeah, I can definitely see why you went the route that you did.

> > I think I would prefer going that route because neither check really
> > depends on the other and we have to think less about unwinding
> > with the checks flipped.
> 
> Now that you already confirm that neither check depends on each other, I
> am more confident to take this approach.

Sounds good to me!

> > Furthermore, modpost is a relatively short running host utility, so
> > I don't really think it is worth optimizing for resource leaks like
> > this.
> 
> I want to confirm something first, do you mind if I send v2 patch with
> the change of moving strends() if block before parse_elf() in
> read_symbols()? I mean, if you feel like this is unnecessary, I will
> drop this patch. I don't mind either way.

I do not mind taking patches that silence static checker warnings when
they are either small or do not make the code much more complicated to
understand. I think this change would satisfy both of those points, so
feel free to send a v2. I just do not see these type of fixes as high
priority.

-- 
Cheers,
Nathan
