Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C788634CF5
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  3 Jul 2025 18:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568322; cv=none; b=MATfCjJ8GLVFIOH+S8RKiBN69Zw60FxlIRPJlS0KORSTZlHG/TOr/0EI09e+CgGU8QtvrGxSmQgHMur9xZOBV1fVJbu0eZTKYcrmYGAMWuunRS0jQeuIxib73ho4SrgbhMmYwyke8BevJMFJUqJEVvQ5zD7wDzNfOCo2rlc3+1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568322; c=relaxed/simple;
	bh=y1ibFcHZ3Gp2zMIJAUNfr3OLUuofICdR6lY4OC1LOpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZN9I5aSDmH7M0Mc8iJ54BbuR+fgPlm0eX/U4wRAx4soxggQaPivj4Q2eLVdD6p3rnxdwt61uM2th1ZbpnDGnNEJfczuMo/9FBSM+QkZH1rnaxUmuZH2sggUWzJ79tZVwWLZPK5/n3O66huxMZX2TVUvSdIl68XTkFvWxXYp64I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tn3B6v8T; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tn3B6v8T"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71101668dedso1017827b3.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 03 Jul 2025 11:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751568320; x=1752173120; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1ibFcHZ3Gp2zMIJAUNfr3OLUuofICdR6lY4OC1LOpg=;
        b=Tn3B6v8T39aTBv6tmN76a6Vy4kHuq4S9wn8P7edCR7itlFlMsisGkYJFUFRKBRI2Fv
         3gXTDd4cZqjdWsexL6e6BWLvLalUwuywroSPfdIlcNkIDaK6s8RBwNzW6/YWONKah16e
         4seY0b9BqfiFNCUX2FGJbu9DaaAGts9SCr0Jy3e3eApMrmUBsiYYHSchVimW/mlAJXeR
         Cs81gr8s6/mQBcS2OVjJd3JC3DH6Bs3OmLaCtqHs12zv2/or3iPFxAxyNqJIkik2sOBW
         OZ7MHXEPvjR4oAwFIprW2K0eExkFQhi3KhgNDwglg/WMstq5UdUUQq/vcHyVj6r9Hyso
         XYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751568320; x=1752173120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1ibFcHZ3Gp2zMIJAUNfr3OLUuofICdR6lY4OC1LOpg=;
        b=PyOO6943tMk4ZJN7nakAl2wyMXp1WCW+pBLlasnNcXToszsrHVNTHnyf7RdTxIf9qW
         6lCfNm1Vq+7I3qHmNS+9u1QXVPL07P995FWyE+zHAl2a0AuL/buF0QgqbFtPJV1M5WfF
         L3m0sgD34VXo7QJAL7s17JTjD1xF0FHsBVV0FAkxacKyUciXyus88lFTYe8IWcrCfPMj
         YTF4u0nLDtbhflmCoeLaIe2S54Z6nm8lU/ErB5mg27I/IZeSYUlvLRdegerfrtNaEYZU
         pspMb30+ORW3zRqF7DonMjq0PckLEWP9qTBHx1m7Yr32eVhgWe6uLPwn9fwPtEE9ZaDn
         fL8A==
X-Forwarded-Encrypted: i=1; AJvYcCX6oUrb+gBARGs66In9/saTO7JO8T1qpeQHonPDyQl2V6kLnizUSvhVQ+JqzYFw9Fq83ORtnrrZrNIG7ISJ5zbUNnVn6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLGOdznNFoLDrRtDAJRqhqRbIC/x+aYxhSN+WJuNvlKOn4vcaJ
	qhzIEjEEh8gSpM5dwBEMuR6qwnQtyejIpuW7CPjQCcXapUEE4cLogUBKoI36hBl99v4eghLoCe0
	l0o29QmgGVcu2GVE1L2oOhprXGL1XuN0=
X-Gm-Gg: ASbGnctWm0ND+aNlDelr5+QtHZD4/FZ+U43Bwp0rX2Sn7uV34ZZbTcMjyDThaKWc3/7
	/qGFIoQEEqWaX0VU4vcLoJXUO8YkltDPZykWacxvnCf/PTlIkktX2+6mKyzaZmR96gFBQbg4k8P
	DLgX91my2BKQ7v1ACopcu61uXV5j99pBW04VhUE9wjmt/1u4JF2lbD0WVRa2SDi2cP/mTiQvmuA
	7o7psWfkyMZSA==
X-Google-Smtp-Source: AGHT+IETh+dtwHH1oQ6RDkj71gx9dRfVQ1cl9MyjEm5vYfcjUtxAw+hOLZg2KSK0HxkTOIcr1LYq8P/WUFL4eiM78gU=
X-Received: by 2002:a05:690c:3501:b0:710:f74b:61ab with SMTP id
 00721157ae682-7164d357a9bmr111373057b3.9.1751568319629; Thu, 03 Jul 2025
 11:45:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250702065908.430229-2-moonhee.lee.ca@gmail.com>
 <DB29OMQH4W9Z.1GPKEZBBIRSTS@gmail.com> <CAF3JpA7wM4JBdd6OvGS+hmv0UahcW=h4HrPNDwRNhduk8iKsWw@mail.gmail.com>
 <1f13328a55c54fb49d8ca1dd72bc5de23f161ac8.camel@sipsolutions.net>
 <6ecced8b962cf3a6f5056a87aa3442c49941e74c.camel@sipsolutions.net>
 <CAF3JpA7ZeG5uxLJr1NQBBzF=UZRi4sj4TSfBw=Pvx7xb1NCqTw@mail.gmail.com> <5fda29626ca04e7c2ad46ca4a3d0eb1d992789d9.camel@sipsolutions.net>
In-Reply-To: <5fda29626ca04e7c2ad46ca4a3d0eb1d992789d9.camel@sipsolutions.net>
From: Moonhee Lee <moonhee.lee.ca@gmail.com>
Date: Thu, 3 Jul 2025 11:45:08 -0700
X-Gm-Features: Ac12FXw2hciaDGGmicqLi-QwVnR0XzGOoZpgR7-KTUS52QJWhiCxZTmjAb3lcmo
Message-ID: <CAF3JpA5NX4s5XrUvOfVg59oOmfFMHoZ0e5+yHynRYifbPY05Mw@mail.gmail.com>
Subject: Re: [PATCH wireless-next] wifi: mac80211: reject VHT opmode for
 unsupported channel widths
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Nicolas Escande <nico.escande@gmail.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 9:54=E2=80=AFAM Johannes Berg <johannes@sipsolutions=
.net> wrote:
>
> I think it'd make more sense to go the other way around and list the
> bandwidths that are _valid_ here, even if I don't see it getting
> extended any time soon (anyone working on TVHT? ;-) )
>
> But in some way I also have a feeling we _should_ be able to reject this
> in cfg80211 already - although it seems that right now we cannot. Hmm. I
> guess better to have this validation here now than fail/WARN, but then
> I'd like a positive list of allowed values, rather than forbidden ones.

Thank you for the feedback.

I agree it is clearer to apply a positive list of valid channel widths rath=
er
than excluding specific ones. I will update v2 accordingly, and drop
NL80211_CHAN_WIDTH_20_NOHT from the current patch as well. This ensures onl=
y
the valid set is accepted, while preventing the WARN_ON from being triggere=
d.

Best regards,
Moonhee
