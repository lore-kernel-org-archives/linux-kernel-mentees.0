Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1D614533D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 16 May 2024 18:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715885938; cv=none; b=MlWVJ+GFx9LYGTj9DuMATGSBgyPPw9FfGyPK+HmEALpe3aKoWbXSgn5BYUjrhD/HxDXvAbO54NpPiSM+Gnj1FlYMWu/UuEhcCBRviENW0n2wg/Qnr0iQJJ8jxCnU6cdToG+pGfT39dtKoZHMyDqiQSuXYjFQuuu0r5KuV+bsy4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715885938; c=relaxed/simple;
	bh=mOGgssVkuZq/po829G7Wr9XNkIdjf3cEtZbegpQCjCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Sr2Mo/wdT6HPpJaTc0vC79wMbYvtyT11Rg4CXDOZZGiUWhS/7E8vG/g6yTUsovH3Wg4pDNx9oPhAxlHdysjUJpN/Kar6dptaY56mry3wJDin/wm+raScFta5a0fgMR9joJk9i2LGRe/nZzhAca9oAA/dPnfNjTwKTMTc9L5D89Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sNDnHCQD; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sNDnHCQD"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8237403A2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 16 May 2024 18:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JErvlWIYHWCs for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 May 2024 18:58:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B2EE6400A6
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2EE6400A6
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sNDnHCQD
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B2EE6400A6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 16 May 2024 18:58:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DF2260AEE;
	Thu, 16 May 2024 18:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0771DC113CC;
	Thu, 16 May 2024 18:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715885933;
	bh=mOGgssVkuZq/po829G7Wr9XNkIdjf3cEtZbegpQCjCI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=sNDnHCQDHtn6VUVbtC4knTUasTlSWgGTTXhz+vPAuhHnNHR2Twuu460lFMvKSLQ2z
	 dizffqpdI12XJNR8VF8HA6+Q5M2WC9syCT8GBLomHredlphqXMk3+l3Hle13cY2BWX
	 sUdX1DIckVf0+3g42d4ONynolQwqRwcsPCOBFBY+Zg56+6mMysdfT6BNpalGJUJDdC
	 Ns4XWyAkc8yrFE7lbTZpkHsl3uKt9ytsCsKxG4RBbCVuA1g+JU9JicD2w5m9EL3WzQ
	 sLt8vXZ2S9lPk0OIzr+9EI2SHrFP3O0WajerAN7Mt0GSpZkkOUsd0P/fFt5qTAuZ9F
	 XvlPhWRrHVbqw==
Date: Thu, 16 May 2024 13:58:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: yskelg@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Austin Kim <austindh.kim@gmail.com>, shjy180909@gmail.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] line6: add midibuf init failure handling in
 line6_init_midi()
Message-ID: <20240516185851.GA2246377@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516174737.415912-1-yskelg@gmail.com>

On Fri, May 17, 2024 at 02:47:38AM +0900, yskelg@gmail.com wrote:
> From: Yunseong Kim <yskelg@gmail.com>
> 
> This patch fixes potential memory allocation failures in the
> line6_midibuf_init(). If either midibuf_in, midibuf_out allocation
> line6_midibuf_init call failed, the allocated memory for line6midi
> might have been leaked.
> 
> This patch introduces an error handling label and uses goto to jump there
> in case of allocation failures. A kfree call is added to release any
> partially allocated memory before returning the error code.
> 
> Signed-off-by: Yunseong Kim <yskelg@gmail.com>

Hi Yunseong,

I don't maintain this area, but since you asked for feedback on IRC:

For the subject line, run "git log --oneline sound/usb/line6/midi.c"
and match the style, i.e., in this case it should be:

  ALSA: line6: <Capitalized verb> ...

"Add init failure handling" is not very specific; I think it's worth
including the key word "leak" in the subject line.  

Remove text like "this patch".  We already know which patch the commit
log refers to.

Use imperative mood in the commit log, not "introduces", "uses", "is
added", etc.  Details:
https://chris.beams.io/posts/git-commit/
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=v6.9#n94
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/maintainer-tip.rst?id=v6.9#n134

The second paragraph ("... introduces an error handling label ...")
basically translates the patch from C to English.  No need for that
since we can read the C.  The commit log can be higher level to
explain why the patch should be merged.

In this case, the error paths leak the snd_line6_midi allocation (not
"might"; it's definitely a leak).  

This case is so simple that you don't need much of a commit log.
Adding too much detail almost obscures the point.  Something like this
would probably be sufficient:

  Free line6midi in error paths to avoid leaking the allocation.

Nice work, good luck!

Bjorn

> ---
>  sound/usb/line6/midi.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/usb/line6/midi.c b/sound/usb/line6/midi.c
> index 0838632c788e..abcf58f46673 100644
> --- a/sound/usb/line6/midi.c
> +++ b/sound/usb/line6/midi.c
> @@ -283,13 +283,18 @@ int line6_init_midi(struct usb_line6 *line6)
>  
>  	err = line6_midibuf_init(&line6midi->midibuf_in, MIDI_BUFFER_SIZE, 0);
>  	if (err < 0)
> -		return err;
> +		goto error;
>  
>  	err = line6_midibuf_init(&line6midi->midibuf_out, MIDI_BUFFER_SIZE, 1);
>  	if (err < 0)
> -		return err;
> +		goto error;
>  
>  	line6->line6midi = line6midi;
>  	return 0;
> +
> +error:
> +	kfree(line6midi);
> +	return err;
> +
>  }
>  EXPORT_SYMBOL_GPL(line6_init_midi);
> -- 
> 2.34.1
> 
