Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81851DE887
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  6 Oct 2025 17:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759773280; cv=none; b=nihvQ3FW3MmLIllOjgjFluV1P2X2cjKKpOzv+B2E67Kfeb9EOouCVykOgoqdshM3L2YQj62j6X0tCn9KFAIrLCYvInpQqucWEvQXfCd5k2aK9x6Y1GLR2iWQplBe1nfPry5hfwdaqPojxtYfo2UnAUaAJuQm+3NJB0Zp8J/5oWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759773280; c=relaxed/simple;
	bh=SaOJ+bWZKtnYSvf8DZSFyMYB3L1UYISDcDX/6cb7FRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkcYY7Fh+NSLVP27hR0U/o3LzSIng6jDu7gcdsPUNbo6X82l8QR+Y6W16vdSiuZVPvt3FZNQHi0sOIc0YyyRSxkBzoDaNy0XTQyeoKg9Ju0m/ScW7La0WPgSOMEKdQzlIuNSGzgJsVnRCcNmRElTaUzJQaKg9bIx+J6a2QS0LwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QavRVqpQ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QavRVqpQ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso12116710a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 06 Oct 2025 10:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759773277; x=1760378077; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaOJ+bWZKtnYSvf8DZSFyMYB3L1UYISDcDX/6cb7FRI=;
        b=QavRVqpQ7GlDef2q77oJlHx9GjRVKQy6Tlw2H5sn6YyFZyUtf5i1aYxiDmrKpr43Jj
         6E9eWY5t6keJ1aewuuNNLm5dhzE7mNXSnA/JFWNniZv/I5Ki8+wyIPWLMZNsOYt0G4Ym
         U91gLHQhyO/pOhVIn8QzweKfOLCiPMrwy24Lc0euwB1jYuIYr7ccmX8gcs1jO0luM0B6
         zTof7XQ5i59xIi+5Sf4/geIkB4Sk3u8z+RUZstpnqEOKuesfI9PH9Wm4vQVeLB3DIXhZ
         PdHaGeeCaxBAf9ysYyZlqadr1adyX3VEOrKda/FRT4b5z8sV+BI+rNKKNKBmNdxYUws2
         nedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759773277; x=1760378077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaOJ+bWZKtnYSvf8DZSFyMYB3L1UYISDcDX/6cb7FRI=;
        b=QvAWHzsXI1fnb1vIOJtggjfv3xm5YXWoXfBa7aKDyNvEQWfKXNev//ZJoFrgANof5T
         I0Rtz6jk13UTVXsU+HdxXpRYZkYNvvxKJf/43ok7peVYCdV88cx/1gMsmIC9wHREZsde
         MSv7cyy7JN9d/jChSueY6ZMRlLni5M3LTPtgukYZ6IK6xgrSaiJiLHYD30kFqubNhPSi
         M0qKiND2H390ZurA5ioqa3tgSUheSftxhsskeudi66JnxxzLZkmtbX9Hmzyd6s2EMMs/
         Viah75QAU/k13Vu5JHRYacX9sria5/FjA8K9qugcWBm0zpAE8Pg8TWygCpoMh8mVh+fZ
         Oh0g==
X-Forwarded-Encrypted: i=1; AJvYcCWzAHPGMgIYmqy4ATOPHzaUa5yJqPEjS/Q591zPtAECT3qRBSwHcS/y+XdP+V7vrofTu9XFq88FGUYV21eNY2alFlZ10w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpeNd8q6hFxx0TnuEOS+tDrtouRtpWR2GIe5z/FY8/2nStryyh
	MdDkEJG/KbUrEH2NBGefSuiWSbIR1q1BXzRqvdtqT5IOUkab+9GPqKiXz32H60LXbveiyjPau+W
	jqkrBGRUJcZv5T4kAdSreI7gyz6VYICg=
X-Gm-Gg: ASbGncsyjgv2GRT+T2s1eK1YRb1HGa4XU4+sd9MnyqnKEp6gOaOFZB2NjCjemo61hTC
	serDW2OALpuZr+ICiewPxr0hR/CAYuoYpKh1Uzfc9NfbkuNIOE7GdMcNqIVmk2AKS9/qr/f1WMs
	JY9f+e62tF8WypiGqh1LspY5U02GvE4psUfGAPbu/wGLLvMEHyvAjgSer15TFEhIPcJktHBppHG
	PE+n3ndDmakuts36EjotonKKFFSOhuWQffz/28qV0RGKU4QVtq7D6ARte5KQnQnOH2Q/GFlTjs=
X-Google-Smtp-Source: AGHT+IHJ/Vo1fUDIbL1nQls8Cr4SC1cob3Zyk1meplN6YxuRUzmZSznvUBX82xUYSZ0V+jqCXqlYjvtl8U3EdawMybk=
X-Received: by 2002:aa7:d785:0:b0:633:14bb:dcb1 with SMTP id
 4fb4d7f45d1cf-639bb13500dmr436309a12.11.1759773276820; Mon, 06 Oct 2025
 10:54:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251004065618.70151-1-vivekyadav1207731111@gmail.com> <aOOyNpNL3YCrLIgq@hovoldconsulting.com>
In-Reply-To: <aOOyNpNL3YCrLIgq@hovoldconsulting.com>
From: vivek yadav <vivekyadav1207731111@gmail.com>
Date: Mon, 6 Oct 2025 23:24:24 +0530
X-Gm-Features: AS18NWCJ1A4gEHjkk_EONI5344ds4mNs5A4ME7lLehyqnImXo5EA8_39H-V9_iI
Message-ID: <CABPSWR4W5Eyz8=NPvysT7XhFY=bjCO_WqqOOMWeZGen9e2fhqQ@mail.gmail.com>
Subject: Re: [PATCH] usb: serial: fix: space prohibited before comma separator
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,
Thanks for giving time for the review of my patch.
I understand your point and will avoid such kind of practice.


~~Vivek

On Mon, Oct 6, 2025 at 5:42=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:
>
> On Sat, Oct 04, 2025 at 12:26:18PM +0530, vivekyadav1207731111@gmail.com =
wrote:
> > From: Vivek Yadav <vivekyadav1207731111@gmail.com>
> >
> > Run `checkpatch.pl` script on path `drivers/usb/serial/*`.
>
> Yeah, don't do that, that is, don't run checkpatch on code that's
> already in the tree. Use it on your on patches before submitting them to
> catch potential issues, but always use your own judgement when
> considering its output.
>
> If you just want to practise sending patches, changes like these are
> accepted for drivers/staging for that purpose.
>
> Johan
