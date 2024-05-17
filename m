Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D86713E020
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 17 May 2024 17:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715967874; cv=none; b=io+AwEpJICY0MrisUz/vndt/5IEBLAwYdJyVE6cwEpV+17B3J0PFgi/Ypts1iNIJjW4DfsO8IBOtw3nWjnb8rFGE+4SAk/qO5M7B9hbmBDR5zQxW7qdkvMpqHgaqfp0SH7KfWNEGDXp0uo3UaaQchsDA1yb5cjslv1NzKKjAbwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715967874; c=relaxed/simple;
	bh=Nm+T58qBk59wXpsTupEzyucDfvFB86ewSPCmThFAah8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=EPdI6ZLxHyIs3/8G5YYyL3JoCiA9FALzXeUu9o5Lo+cTKJfIxaK1xoAx3BCwb5JHv4hVLB99UteUSH48akb3PgucQ7YC9ivzRmbxr2OvwtHWJy6xlrfdL3vAf8LRB2StHeK/JBsHOIaD1g3Dh2QZ2kQZ+4f7p2G7s2Z5MXIDzgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azC3BY/A; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azC3BY/A"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20280605F4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 17 May 2024 17:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5CNqOML1oVhb for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 May 2024 17:44:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 61153605E3
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61153605E3
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=azC3BY/A
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 61153605E3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 17 May 2024 17:44:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CA153CE1B1E;
	Fri, 17 May 2024 17:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCFECC2BD10;
	Fri, 17 May 2024 17:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715967869;
	bh=Nm+T58qBk59wXpsTupEzyucDfvFB86ewSPCmThFAah8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=azC3BY/ASdaD7ZoBeeOgbrcgSvb3Rv0u7mwIQCIdoWds8KpPU2CuJYW7tjwjBnNcR
	 +fKze3Ck8JVYLPTffyd4qAN3/qN/UKl+O26D8Bd5fXuTwvZCfpxrRnvKaex2VYhPTb
	 F7DAbRTBQmKzD3KOwrFuNbHUHV7/bQDEHiNpV/VKsChMEv3zKHSLDIMzv0AoqTpIus
	 Sfun2vIremc5OU92byD4KTGZeQQmMdq7tkw53207gvxPOq3DfGSKsA9/81p0eUZ6Cn
	 VNsv1U4rs24nhjE/uyEG+ECcSjdu72WfuLrUJzkK/Hgj3HUBOfIiB0ofURNhkLHtyf
	 gnRQKYvetcyNw==
Date: Fri, 17 May 2024 12:44:26 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: yskelg@gmail.com, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Austin Kim <austindh.kim@gmail.com>, shjy180909@gmail.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] line6: add midibuf init failure handling in
 line6_init_midi()
Message-ID: <20240517174426.GA2285947@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734qg260i.wl-tiwai@suse.de>

On Fri, May 17, 2024 at 10:32:13AM +0200, Takashi Iwai wrote:
> On Thu, 16 May 2024 19:47:38 +0200,
> yskelg@gmail.com wrote:
> > 
> > From: Yunseong Kim <yskelg@gmail.com>
> > 
> > This patch fixes potential memory allocation failures in the
> > line6_midibuf_init(). If either midibuf_in, midibuf_out allocation
> > line6_midibuf_init call failed, the allocated memory for line6midi
> > might have been leaked.
> > 
> > This patch introduces an error handling label and uses goto to jump there
> > in case of allocation failures. A kfree call is added to release any
> > partially allocated memory before returning the error code.
> > 
> > Signed-off-by: Yunseong Kim <yskelg@gmail.com>
> 
> The allocated object is already freed by snd_line6_midi_free() that is
> called via rawmidi private_free at its destruction.  So your change
> would lead to a double-free.

I stand corrected, sorry that I missed that!

That said, it seems unreasonably hard to verify this path to
snd_line6_midi_free().

Sorry for misleading you, Yunseong.

> > ---
> >  sound/usb/line6/midi.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/sound/usb/line6/midi.c b/sound/usb/line6/midi.c
> > index 0838632c788e..abcf58f46673 100644
> > --- a/sound/usb/line6/midi.c
> > +++ b/sound/usb/line6/midi.c
> > @@ -283,13 +283,18 @@ int line6_init_midi(struct usb_line6 *line6)
> >  
> >  	err = line6_midibuf_init(&line6midi->midibuf_in, MIDI_BUFFER_SIZE, 0);
> >  	if (err < 0)
> > -		return err;
> > +		goto error;
> >  
> >  	err = line6_midibuf_init(&line6midi->midibuf_out, MIDI_BUFFER_SIZE, 1);
> >  	if (err < 0)
> > -		return err;
> > +		goto error;
> >  
> >  	line6->line6midi = line6midi;
> >  	return 0;
> > +
> > +error:
> > +	kfree(line6midi);
> > +	return err;
> > +
> >  }
> >  EXPORT_SYMBOL_GPL(line6_init_midi);
> > -- 
> > 2.34.1
> > 
