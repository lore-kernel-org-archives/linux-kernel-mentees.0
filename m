Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36AB171A6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Mar 2024 08:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710316872; cv=none; b=gv3MEOgNjK6u5ZKOghzBlXw8I2Fmav0FwtIWi3OMRT5PCyY71Vy8Zn9wJqMTHxLkIvPQyELQjbGSMO1u+yQwdGcz6Qe3WHYPK1gImg3cS4KEBoSS4fBDvAL5PGnS6dnfiLcobakpyGCknZNYZdt9KBE2ofzBjtyxss0BFlCVJdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710316872; c=relaxed/simple;
	bh=/mgBL5lE5rChksbNFZVodfppzbCHZV51oEQM0UW/yG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XvUCar66Xoe91EAJmn2j6flOaLKx9431flcbX77MiT6ViVduDn0zzMzFwZyXITsPs9BUmBF++Y5dvKn6ijDGwAJqUJ27qfd0AizX0MtC3L1Vj/5U5bWK0aZfxPyL6VX+enTnt4NAE/ZWbtP6hxifybONdwIxlDsVFsSPDOTpZR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqQv6hZl; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqQv6hZl"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8873F60772
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Mar 2024 08:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id akM4oORYOdLf
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 13 Mar 2024 08:01:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 12A4F60767
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12A4F60767
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YqQv6hZl
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 12A4F60767
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Mar 2024 08:01:04 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a44ad785a44so632014666b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Mar 2024 01:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710316862; x=1710921662; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mgBL5lE5rChksbNFZVodfppzbCHZV51oEQM0UW/yG0=;
        b=YqQv6hZly6tb1a1QF9UBIEtrFI/2GCA6ZdH1L7uqPj0kjIRK/hE95pESIdkYAe2Erj
         nLBmX7b+5lX28W8JxMb4+Ek81wZ81/QBRilnxV0yvqbx+vKVh/YIgU5T6mUpo2aOpeT8
         3MrTwwicW8Kv2SFIUTjVK8jfa46bdTvgApxaaD4GGBbzLFAPKShPa0uqNrwbojMrIIRS
         XZxFV9VvdfbZk9vO3gXKu/QRDi1C+XWseKAFTuUAb0Q0b9ry1N09fNxR/ZhRw5YFn1wu
         H3bBFLOkSODvqd0BM7Hi3TQiHAhxud4Iqv69r1X1ZIFgZIGeibUBcYu3dIxK9aMm/okI
         SuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710316862; x=1710921662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mgBL5lE5rChksbNFZVodfppzbCHZV51oEQM0UW/yG0=;
        b=Ff+8S2iyj6N/OFNZa6PA67z1LihAMSRU4q3vGDf7efOYIxI/18w8cKhChHLs2t21d6
         XjOWkHTzNnrGUhAqjDJNW2zaLupDnmWKs7WKvHN1S0S8u+rZeYuQdIr5LrDr9oksoa8b
         f5VIDwGnStUHzGNgTTwt4+ZV2BfjRSpOMOXhUCJVhL2DfzAFj696TWXGM5hvGw7LGDxg
         oArmTHAvT85MvQBlUZL1uJbs11Vxy7Rc6JioS/gSvQzwBkWz7Sz+0pfCvIfAsGgdGoFX
         1EnitX7WckrxTREN/tS3SaJ0sULuB1i1dpeWQtt9Em3Ea3dxR0ER7yKqfX/g+VVumTnL
         vqgQ==
X-Gm-Message-State: AOJu0Yw6lJZWPTesFTZ44cbp7YHRXDLEa2w41c/uUgxifu/Kf+6z37eo
	qRNoeYd7i1VmqECCoc8kES60v+u+gbFFpi/r/gDwtjhNi7pkzWVcEwkwrwNED7VHydpJ0U5vIam
	GgS6ODjlUyLN1qvb1j3niWB2f7Jo=
X-Google-Smtp-Source: AGHT+IHdEv8h02XcyCQVWuP/2lRL64G9FUBmkjKT+obT19Cg6XjCs6dWeJlziVpo0NyUwW9CGXJB8ln0txbGZhZQVNs=
X-Received: by 2002:a17:906:6708:b0:a40:a615:a9c4 with SMTP id
 a8-20020a170906670800b00a40a615a9c4mr6803507ejp.65.1710316862437; Wed, 13 Mar
 2024 01:01:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <abe5d265-e26a-4c13-b54f-429f3b845dbd@gmail.com>
In-Reply-To: <abe5d265-e26a-4c13-b54f-429f3b845dbd@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 13 Mar 2024 09:00:51 +0100
Message-ID: <CAKXUXMzkSsskNqdCDc-q0vn0C4jy_nHaB36TT-WhxYq-eThWnw@mail.gmail.com>
Subject: Re: subscribe request to linux-kernel-mentees
To: Kohshi Yamaguchi <kohshi54.yam@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 8:07=E2=80=AFAM Kohshi Yamaguchi <kohshi54.yam@gmai=
l.com> wrote:
>
> subscribe request to linux-kernel-mentees
>
> Thanks,
>

Dear Kohshi-san, this email above is NOT how to subscribe to this mailing l=
ist.

Good luck with your next attempt,

Lukas
