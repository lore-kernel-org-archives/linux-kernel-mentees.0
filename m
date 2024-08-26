Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7C480034
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 20:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724702633; cv=none; b=nSw3ceVMhgzBBPBO3cfGMsMqtzxMAKOBulSJCVMaGe4lFmeAJ8vy/acyLZVgs1rVepc1O8MZd+CJtHB9cuKOTwjzpG24nH3pfx4Dy9ZZZC9G9GP7JlZpsT1+EplGfyrIVGNOYyO+deA/yFwjlcuUltf7EnzGefUZlg7l1t/ctjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724702633; c=relaxed/simple;
	bh=SJ74gEwTuALUMMJ4yxY4RwKZXzLKiT2GaQEX/jOvqNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MV8yg2tl4sxosjKKUCvD5cGDnAKj/3nDTrqX48DBk+X2mBDJrVxNKOrEovFejaTQvC0+O3DuA/gKV44xwIVhSq55bWtcDkG5WHzkiKXKEkrs6Jmu1vibg5lpZWYUPsGc5issQctGCOBv6EJBbTcyFqoCNrgCdG5r77mBO4H+gBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+kFwxj0; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+kFwxj0"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0509810B8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 20:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0q2Hs4Ivw928 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Aug 2024 20:03:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA044810A8
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA044810A8
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z+kFwxj0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DA044810A8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 20:03:50 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2d3badec49eso496720a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 13:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724702630; x=1725307430; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ObXozr3BJ6v7ZqhdBN9DFf0iC+TTqCIr3HMlLGbcJk=;
        b=Z+kFwxj0NS0ElnsD2czZLUbbs75/uE37KKVnxTx6X76iaZucq/XZ3PQ7W/Ore7MVhU
         BB4tMu3oR/kUrTPYYbcENmnsIM+d7I31hT7Sruj1BAOKjSFaDmlGsNBmq3kVs6KnlOSg
         XIivTyVEezMLdZUGu0gjvH5eaWhjuGRd4r2KU22W8xX7mGH/etWmBgCKexrNlw/V8vN/
         KlNOL4V8auybA+rD6X6AoODjME4Pb4JN74eXuH0Pm0FUCWpmIrt0dORktpDCz0v8XW8e
         Ww/NWNuYzFryKk+ODkGzLq8mYqR99roSA/Zjr0L0DDKzkqI9l2bRTkM8ms49ckazi43c
         pWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724702630; x=1725307430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ObXozr3BJ6v7ZqhdBN9DFf0iC+TTqCIr3HMlLGbcJk=;
        b=GDNixccAlyPzdr8HYC/K6DP0PVgm28pvyJBphc1WIzgLa0xymn+gBrpN0h3sapEFHi
         PfS9AiGtlHLQlN2hgEZmq7quyJrmSlQjz/h/sDhc7zcezZzhvMf3sjXp+V1ff+cEHKgU
         nFwIwuK6he3xAkZ5XmiLr3C3fLa9WrEvXMkiTwlDVDhYqYJcchHu1jefK7GeR0QboPKY
         5+LxfNOxM8dSIiTjF4/wdy8SftY8oeXHC62ga7S759htcxxPDxIyV52H6Au4FgfT0F8j
         mGqR8hdt0fSK+LkLgDWwgS/nrsOJLTniwu4g74rbnvoXqeA4K5S6ttFlk3cX5/4x632n
         mbyw==
X-Forwarded-Encrypted: i=1; AJvYcCV8/eLwqJd995AXKoI/1BxmPcb/wbhrS49n5/uph8IU5OupLlI+5leDtlrn+iyOdbhSS1iqCFOSnyGQg/6PgPG5pMNnnw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyupptisTWe4DcYa+VgSJSo5GVqwsGQw7Ci8mxsffosiKiJP4km
	DSOEodTADsfTqLsjNFIweBBBrn7OpXqvUWVRukdfnAupPmLQLPpaDBsK6EeCBDXoAtS7REegZMu
	v7tfbSNiXmdKQOTYp7nvYapMfVVA=
X-Google-Smtp-Source: AGHT+IF06Qa5kKCgDuixFMP84Oud7TdmALiwNRboY94oox6pPnz2S6FVPKSATudfOFNYzfDRJrY+uZXQgkOB1Cm46Gw=
X-Received: by 2002:a17:90b:188b:b0:2d3:c488:fa6b with SMTP id
 98e67ed59e1d1-2d646d8b377mr7653756a91.5.1724702630001; Mon, 26 Aug 2024
 13:03:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240825221806.253575-1-simeddon@gmail.com>
In-Reply-To: <20240825221806.253575-1-simeddon@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Aug 2024 22:03:37 +0200
Message-ID: <CANiq72ns_Awo3HD+P-hHrAOHQemRirtp3Zvei9OYgfLf8eWncw@mail.gmail.com>
Subject: Re: [PATCH] scripts/checkpatch.pl: check for non-permalinks to Zulip
To: Siddharth Menon <simeddon@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, apw@canonical.com, 
	joe@perches.com, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 12:18=E2=80=AFAM Siddharth Menon <simeddon@gmail.co=
m> wrote:
>
> Zulip links to https://rust-for-linux.zulipchat.com can break in
> case of renaming the topic or channel if they are not a message
> links (which are permalinks).

a message -> message

> If a non-permanent zulip link is referenced emit a warning and
> directs to the zulip documentation.

emit -> , then emit
directs -> direct the user
zulip -> Zulip

> permanent links are of the format:
> https://.../#narrow/stream/x/topic/x/near/<numerical_id>

permanent -> Permanent

> Reported-by: ojeda@kernel.org
> Closes: https://github.com/Rust-for-Linux/linux/issues/110

Sorry, I copy-pasted a template we use for "good first issues" and I
should have not mentioned these two tags, because it is not a bug.
They should be `Suggested-by` and `Link` instead. Also, please use the
standard format "Full Name <email>".

In addition, the link should be to #1104, not #110, i.e.
https://github.com/Rust-for-Linux/linux/issues/1104

> +                            "Use permanent Zulip links when possible - s=
ee https://chat.zulip.org/api/construct-narrow#narrows-that-use-ids\n" . $h=
erecurr);

Hmm... That link seems a bit too technical.

Perhaps it would be easiest to give an example here (like in the
commit message) if there are no better docs about this.

Thanks!

Cheers,
Miguel
