Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F4726656F
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 13:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243738; cv=none; b=XsFWcvCf4rvFyKJ9DSY554MWaVOq4q5znkmSJHyEOWvdQJGfMitKwJAwS24K0sZ/iA0YXI68D2khNcK4pB06hwwdMSzjDs1EFgUC7HwbQYzoUohSBDevzVlA/InEW4cDXFwcJssqZXXmEBAO0eAZOaOObA8tQ6+u6hwebZI/oFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243738; c=relaxed/simple;
	bh=ZKEn9aBGgxZBwMzz1mJ0Df0kwnfP6ieCJou/s/mq3KQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSBRKx5AyQuaV4gmf3SOJLvvvewWOsi+emwwwQAh4WTEDIg6PQDTfxHyCoDMJkK+Csbj7HNtKnMKoK34L/NHFMolZWPkF9ZVgpuFf4ibPDby3tkQFIhlhKlEFOQQQvTBw8+DIDhFGuJH2MHR/l4qxLtsztXhLdi/AAqYCQjLQMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjHJop2+; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjHJop2+"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-477296dce8dso38090601cf.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 06:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745243735; x=1745848535; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKEn9aBGgxZBwMzz1mJ0Df0kwnfP6ieCJou/s/mq3KQ=;
        b=OjHJop2+SWiNdhqxOHnZ+PM1Los8B0DY+aie+aMuh3rHWz1S8fTNRxs4xlgcxWUCGi
         N1FOPCXeqa5emkihb9ZXteqamXbKCCTRN/ko53F/seQMQCmarZGgsEk1Z1Sy1w4GBkYy
         xLGDpW6yLbZeFo7oJEYKwaiZ5wmBj9eyF+AnSusZHBQvaOzF+eeSbXnvDMs+ADTIAZC8
         TcuXZTqzNbnsdO7VAeFbGJBXiqzPBocCO9zGBumsmhDF1q3oI5Iwqdvg/o4gKUcHiboZ
         XraYecUKn5eyGbcnr2nOFpvoZrQ3ciPId+40OwSsVXkLKU7B5c6ecyFj6mSiH6Ccxcv3
         SVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745243735; x=1745848535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKEn9aBGgxZBwMzz1mJ0Df0kwnfP6ieCJou/s/mq3KQ=;
        b=a8VR15ozPPiA5RvYclZSQ88qaY+4+rtUfTxEIBv5mTBSngnQAgOw9WUdz+PZwg7Eo7
         UVsJ2YNK0XoJZch0I1OevUAtpuZgyylVQAr7XwvmHlzzD7G6D2t5uZnUhju3ZqyN/974
         CcSIOA9eQ3v7fKGSlfePm09ErwpfGU0lYaTELFTS3LrT31kM7NjNw2cEQPcRSPrYwDGj
         mbsD9iITLjGMAjx3OnDmTY0gDdGlpJF6gNiNco2a+fZ8JZpA7VNK99L7bweT+MfsUkXo
         qM06OCTOtRQBkV7g3abNEQjnLq1UymrOYJbo3eg7/aCo8Frm+pFUw5WK6GgSJ1xVA52x
         vawg==
X-Forwarded-Encrypted: i=1; AJvYcCUFlwII3hbTEzzQRP1A3cGl0CsNorklk1UjmuWtha3TyazspMssaul4SmNwexFmDO9Br5sTWJVBvxMlomz2vopM42BMEw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPWozr/oGV0jpVF23PdUDP+LwUnBB8Tge5Sz2qL6gIxo954a6j
	jtsJ5fcWlPL+wlOd2O022ucA/RZdUBh8IqbKqSMJRKDaEsrFbWXvmsOBVv39uKK8DZkfZL/Cs5G
	yLNoOdyasQJUW3y4l3QdsgS5nsP8=
X-Gm-Gg: ASbGncvAo6szuZaDbejAWHobmpGlhDboTeTr9R4E8Kp+7cmQCAaNmcDQsVk6J854zBj
	Lds5seLwNd5ndE1x3vqyzzjZ1rJ18ZKFMGBVxqEvV/re6sOOeQIg3ygjzxB5KpnoUNKBxY5SfLw
	BHfsyl3I+//6qFUnH4/xDaidywraaH7xmbrUcjpKQQHtqtxAsl/m0/kw==
X-Google-Smtp-Source: AGHT+IGe3nS55q4799S3M9i8763/VBcBZkGtpasPvAPLMKmDSQ8P4wPK3n7/shzb2OhfTHLX3O3iRpkuRFOnTaqRN3k=
X-Received: by 2002:ac8:7f13:0:b0:476:8825:99bf with SMTP id
 d75a77b69052e-47aec3cba27mr234780651cf.27.1745243735417; Mon, 21 Apr 2025
 06:55:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250421124915.32a18d36@jic23-huawei> <20250421131539.912966-1-gshahrouzi@gmail.com>
 <aAZNCEUejrTgy_yZ@debian-BULLSEYE-live-builder-AMD64>
In-Reply-To: <aAZNCEUejrTgy_yZ@debian-BULLSEYE-live-builder-AMD64>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Mon, 21 Apr 2025 09:55:24 -0400
X-Gm-Features: ATxdqUEyCdkkjmlQnLpYD0QbwbveqWM8VEc031aMZldztG8lgKbjxR4Xs8GWJg4
Message-ID: <CAKUZ0zLEacGg5cD4wGmFz80e4FQ9A=JsVyrzGAHkKEeOT=CU2A@mail.gmail.com>
Subject: Re: [PATCH] iio: adis16201: Correct inclinometer channel resolution
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michael.Hennerich@analog.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 9:48=E2=80=AFAM Marcelo Schmitt
<marcelo.schmitt1@gmail.com> wrote:
>
> On 04/21, Gabriel Shahrouzi wrote:
> > The inclinometer channels were previously defined with 14 realbits.
> > However, the ADIS16201 datasheet states the resolution for these output
> > channels is 12 bits (Page 14, text description; Page 15, table 7).
> >
> > Correct the realbits value to 12 to accurately reflect the hardware.
> >
> > Fixes: f7fe1d1dd5a5 ("staging: iio: new adis16201 driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
>
> Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Should I have included the reviewed-by tag on the latest patch sent in
this thread since there were no changes to the code?
