Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D1B35961
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 14:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745244979; cv=none; b=OriLooRnBPYK1JQmHat87Nu3hWNtCCCRL0ZXy5t1DzOUZ39Q498BMOlWPiTQJ+E4cxWgFfmb8bHe8sQ9WmTMx5arMz7iXiJh/bGEdpBeHwWGrfKvXPS+/zaTV77AtzDenlhr7LSXEoBLGfyvncNbra2eR07CDTqN/1mYZD7AeVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745244979; c=relaxed/simple;
	bh=AiGnNSmslAQcJ8E34wzKCScAL+VTPdg07eYzTNVuK0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uok3VH2+awzdJlPmg3HIKrQ+t06Dn2Vld5x2qnzF9u6W4YHtpClg3epJVhq88zaXqBwTDfpIrskgExgH4l9KxzGXZjLlwZ0ROv5i4vRH9tGG7fEe7SUvd7bA9+wQb2+yx18vrLfVJAyCW5FZAH2iUCFWgho1QmAfVEA4QEfS6OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Joei3mzq; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Joei3mzq"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-47688ae873fso42593871cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 07:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745244975; x=1745849775; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AiGnNSmslAQcJ8E34wzKCScAL+VTPdg07eYzTNVuK0w=;
        b=Joei3mzqW0gILPGlFnfPXd2TPKzkoMJiJnWUSdMi3XdJtS2qIcFlaFcRmfzK3Vs+Kx
         aiKWFtprfxNIJcYwDaE/TGLz5Ml7qDonQouQLLk50JvFIopHRiiZRAoUBLsYmmSxhSu0
         1GXS+15JLeDodynSE2pNBvdXFC0J8H/ykg7UWP0/cFXvm5HrljwvVMrHIYepCutEXorJ
         rS57e8tHaaLfZV61InXM3B59NOJyNak2rwNOxIrPpKLRKbpETYPTDoimti9MpO6mkGUN
         u/VFNGw1DCSgGMRmgtI9qT1tG7f8404CNuKVGcvrVvCDTFhN5XzOu0FT6zfe9/TTbVj5
         fdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745244975; x=1745849775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AiGnNSmslAQcJ8E34wzKCScAL+VTPdg07eYzTNVuK0w=;
        b=PikDdv8wbrOrJBp0vse/X/XqBKecJ4vMQsSZJAGPhjDDYA2Ru9WajVhTa1JTv2uu2x
         ME4PZI33gN5geWO6zCBZjKcEYSMCo7iXIEk7t88I1Go1B+ttSDGTOyclHsncz5V+KHak
         aaReOokP53/fKCTa1ou7yYGeUC8VCAb3s01Sxqbr6rN3l/AvAPlKlAE0oEA/cFzPEh1u
         A9cjsOqYsIwF60MIwjDdDHiHGrYUdv7UCDqYeoeQD3iIowYZHx/ofnQhH6TMxTCx4UJ9
         Ma1WxA8p4zTjUJrgYcMAX5seVxdHIXiJpV9IU26uPnFOsIty7jUp6/Fjv6QnmRnZ/UHM
         3iJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWO+QRImB3MshKPUeTC9nQ3m30fxuRaa3g8UCoDKKvgIUP3jlp+PdZM91V0gVQAZM5KeHHLRkTLABcTYFHIH+s20k7AA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOlfezAbG+uDLvI+IG6B41cDzTkitvcXV6rhdk4Z/PF129oMqD
	Q6zRnX5EpUZg4md9lX071ONgZhnLvyrdEMbxs2ZP89pEugauo6cJ6q2JpT/iNq96GRnZyKaY/xw
	x0o6+LiG11UdK4SmqJ24kS3ZXjHo=
X-Gm-Gg: ASbGnctJzWB+CFGFRY0uvbgxNUEjyni4rINi/fkcSwYxbT1X1RnFANGM0zsiLNwYT2K
	ezfOVU7scoftefFHKQb9PmzF5KB0lvw7kjMhqm4aHZ0I0WJe2FcazN9w6QG27IMsyZT2ImdeH0/
	SFxQWVsqnq+tIgaLnQIN9Ca/9eD53WXOGBjx8uQm4/IcteadBzXU/ffA==
X-Google-Smtp-Source: AGHT+IGPDbjwaGUH4InYWcFLu7kBF8JZsjStf3YQR+5XpjFvZ0PtISHj2loyaOYzbIFa94xiQWzEjDkG2RlxMJV7CG4=
X-Received: by 2002:ac8:5d16:0:b0:476:b4c9:f4bc with SMTP id
 d75a77b69052e-47aec4c5774mr209697121cf.46.1745244975597; Mon, 21 Apr 2025
 07:16:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250421124915.32a18d36@jic23-huawei> <20250421131539.912966-1-gshahrouzi@gmail.com>
 <aAZNCEUejrTgy_yZ@debian-BULLSEYE-live-builder-AMD64> <CAKUZ0zLEacGg5cD4wGmFz80e4FQ9A=JsVyrzGAHkKEeOT=CU2A@mail.gmail.com>
 <aAZRRfO1AmiHs4Bf@debian-BULLSEYE-live-builder-AMD64>
In-Reply-To: <aAZRRfO1AmiHs4Bf@debian-BULLSEYE-live-builder-AMD64>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Mon, 21 Apr 2025 10:16:04 -0400
X-Gm-Features: ATxdqUHEnmhxi2h48Tjc7gu63ef8gOHHrO7_kehbD9oBxx99ugywagJADQennYM
Message-ID: <CAKUZ0zLk8OCgUUVpcFRygpY+iDYjm-=8kHpoosZJpAtyyeL0AQ@mail.gmail.com>
Subject: Re: [PATCH] iio: adis16201: Correct inclinometer channel resolution
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michael.Hennerich@analog.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 10:06=E2=80=AFAM Marcelo Schmitt
<marcelo.schmitt1@gmail.com> wrote:
>
> On 04/21, Gabriel Shahrouzi wrote:
> > On Mon, Apr 21, 2025 at 9:48=E2=80=AFAM Marcelo Schmitt
> > <marcelo.schmitt1@gmail.com> wrote:
> > >
> > > On 04/21, Gabriel Shahrouzi wrote:
> > > > The inclinometer channels were previously defined with 14 realbits.
> > > > However, the ADIS16201 datasheet states the resolution for these ou=
tput
> > > > channels is 12 bits (Page 14, text description; Page 15, table 7).
> > > >
> > > > Correct the realbits value to 12 to accurately reflect the hardware=
.
> > > >
> > > > Fixes: f7fe1d1dd5a5 ("staging: iio: new adis16201 driver")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > >
> > > Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> > Should I have included the reviewed-by tag on the latest patch sent in
> > this thread since there were no changes to the code?
>
> Not sure I had given a review tag for this.
Ah it's probably because I resent the patch in the same thread.
> Hard to find the previous versrion because it doesn't seem to contain adi=
s16201
> in the subject name :/
> Anyway, good thing the fix should be added to IIO now.
>
> Regards,
> Marcelo
