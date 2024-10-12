Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB8115573B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 12 Oct 2024 10:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728730209; cv=none; b=hhebd8KWTSVnLGCgzroPd4ppGNFC9V/Zbv2sDACHvMAnZevEyg/fVl/S00Px/mbf3l7SbCmvol61cW7/y4on0RnrnQBeS1W58COYcwNxvm15Fk2rFKEw1KxtQskGjRj6rqrcFFV8nq1jucJ860LMHPKX3bxtObKDxB1OLTGoyXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728730209; c=relaxed/simple;
	bh=qIdTHnB1Iea+3YXWC7zVPebZwNXSxXSOPYpHQYxvP0M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e0qcK9Tjc5W1+a8llAoxVUJrCAJ59ma6oDKHBx5qXZ6fiPOgP5+4Q09e5j3Gtj92joBh2ZJsvaEI8NKakT0udk1sQ2Dh9HhWO5WBrNVepoo/whAlsIMX7KsBynbOnjLLLoctmYqYhJepnCJEMkffB4jMJe9ZR4vvVZl+t4284wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vOQLADPc; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vOQLADPc"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D802960604
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 12 Oct 2024 10:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVYyAC_VsWFR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Oct 2024 10:50:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 18491605FC
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18491605FC
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vOQLADPc
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 18491605FC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 12 Oct 2024 10:50:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 325B55C4D36;
	Sat, 12 Oct 2024 10:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 059D5C4CEC6;
	Sat, 12 Oct 2024 10:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728730205;
	bh=qIdTHnB1Iea+3YXWC7zVPebZwNXSxXSOPYpHQYxvP0M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vOQLADPc/sqK9vLeDVFajf1QBSFysGWh/5AkabOIwWRW0Q9qOtvZLbLwng/e7yIBj
	 PBOGVvxUX3jMHP5mvFrwGhDJmTx5R5DVdiI6vLhQDF0iv0vez3juFkF8F3hIJbLC7S
	 ERJdjhVABPtSDcCJ5rLMNDl6y0QYPRYVTIK97HoeG/PZyzSLWQG+llGMEbGdGTteuk
	 3DZ/6shlgYHdJXxc7o0HWZz2JdA+NaoAdgTL0TGpJUdlHU8llB+psqKYoM2UHHY2gt
	 Ay7hw6LXe7D+JddyDsDgGoDQ08eUXvl5jnFpFWQtX0wP5DokjxLZVqISyY/ZGPFU14
	 9aYmAOlm+Fzow==
Date: Sat, 12 Oct 2024 11:49:53 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Vasileios Aoiridis <vassilisamir@gmail.com>, "Yo-Jung (Leo) Lin"
 <0xff07@gmail.com>, linux-kernel-mentees@lists.linuxfoundation.org,
 ricardo@marliere.net, skhan@linuxfoundation.org, Lars-Peter Clausen
 <lars@metafoo.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Angel Iglesias
 <ang.iglesiasg@gmail.com>, Adam Rizkalla <ajarizzo@gmail.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v2] iio: Fix uninitialized variable
Message-ID: <20241012114953.25a958ef@jic23-huawei>
In-Reply-To: <0ec5fd64-a172-4054-a2ef-1c12db41beb5@gmail.com>
References: <20241011093752.30685-1-0xff07@gmail.com>
	<20241011115334.367736-1-0xff07@gmail.com>
	<26f2e35e-0a07-4b24-91a2-a48d4bc5dadc@gmail.com>
	<ZwlvJCxdiRqRWu6Z@vamoirid-laptop>
	<0ec5fd64-a172-4054-a2ef-1c12db41beb5@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Oct 2024 21:32:38 +0200
Javier Carrasco <javier.carrasco.cruz@gmail.com> wrote:

> ...
> 
> > 
> > Hi everyone!
> > 
> > So if you check also the conversations that we had here [1] and in the
> > previous versions, indeed the idea behind the offset is to use it as an
> > self-explanatory index to a char buffer that holds in fact s32 variables.
> > 
> > The data->buf here holds the values that have just been read from the
> > sensor. If you check on the channel specification of this sensor,
> > you will see ".realbits = 24" in both values that the sensor returns so
> > hence the value 3.
> >   
> 
> So you are using 3 = 24 bits, but s32 not as 4 bytes? the whole thing
> would have turned into sensor_data[0], sensor_data[4], and no variables
> implied, correct? But I am discussing too much for something that in the
> end is more or less the same, I am fine with this proposal.
Applied the fix.  Thanks,

Jonathan


> 
> > I am not sure if it makes sense to use a macro here for each one of the
> > 3's that are going to be used only one time each and in order to be more
> > "consistent". But I might have a wrong view on this one so feel free to
> > correct me!
> > 
> > For the initialization of the offset indeed, it was already mentioned
> > here [2] this morning, but on a different patch!!! I couldn't get this
> > error though with gcc...
> > 
> > Cheers,
> > Vasilis
> >   
> 
> At least for the things I do in the kernel, clang catches more issues
> than gcc. Sometimes even gcc will not complain, and clang will fail to
> compile (e.g. a goto before a cleanup attribute).
> 
> And if you run smatch before sending the series, you might discover a
> couple of extra "surprises".
> 
> Best regards,
> Javier Carrasco

