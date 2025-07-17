Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523D01DF968
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 17:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752772785; cv=none; b=ZPdLMHQozmKH5aOmkBo0WCLe4DeZygkzcLRs4tETaUCJ3TtfD747dtZZsOlVhQGaHp/nOEZ4Dle7g6DQAzIUHOAFzEiRG1cJe3UPeqKgbCCHxxOubFSOAnmNYRkaWCLxgd6meKvD40GhgXtng/70Pn2IO53HlWwqOf6PVT6nysI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752772785; c=relaxed/simple;
	bh=W/DhiasmwCBuFbQCyp1dQTsirgqXj/Eu5bRAkhtMAog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eK7Seo/Lv5AboLiBTGfnG5wozUSO4OgH2QW3Lnr/DnEN9L0ub5xg4NG5X6PTtlz9/1C1CVlJRBkgpPrbB4QJkMGTh0i+BaIYk9GQ8JFgaul3JlAs0CdaEoTZ3xIZfcg7Dpjv2quNXbSe8r/fTpgYrGZOXH+ZaZWijtfx6OThulo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkhLoDmc; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkhLoDmc"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-612a8e6f675so1535460a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 10:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752772782; x=1753377582; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1rMoCL6Z35Q1ZU9wAKtXkSeqp3Yq+uqdhZO2nKQumQ=;
        b=dkhLoDmce9+fVERMTGtzfMgr/eBvRjXSxWIzXqNaWddXgRWMZ5AY/bHPfP8FTB/uTV
         muI6osHUOeEDj/Fet88Ai9tLpS4/COFe2ugif6L1TkkUTKnE2WQsd2x8caQ5PhC+V4V4
         3U5UxcA7+7cGiRw0bJYDOayTqiCd7OLGKer/Bu/kPQDs9eps9gdR2vqfxey3MYNdke3y
         eQdF6CyI/H6I5i2sQq7LZ3dgwjgQ84fpqP6T5C78sudcGO0okW5VflYEAX+O4SF/MK0R
         GPzw5pz79qKVyNCEcyagqqFs1VX0J/PRnt6mW5kOdlcmVuvdMexc2kjHO6UkrcqsIdfA
         jyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752772782; x=1753377582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1rMoCL6Z35Q1ZU9wAKtXkSeqp3Yq+uqdhZO2nKQumQ=;
        b=ELRGGPZN7UJNBiOqt1nAPs6GM3x8VynlbYczSj6Kb+iJllZdxV68/bhtdr3bRAFNbr
         HGT4ritHiLcesPwOVLAyYGsjOwDNwH/M2lyKFAkwgl7raFSeDXtL9EZgGgUR6uaBO/pk
         6o+0+bF8phTROK+BT4Bn8Bt7N+dqUT8gWtO9gZu2cJKJQGKsQdMSll42MdNE6AAZ9146
         qWm7zqL+LpGvCK6vY0UnJJcw0eDk/WokrFr2Kvm0IyBf0/DjFBn2I2gj60ziJ3oN+9gG
         XnZmFfMIG6afWpY7iLiokI3XSUqjM7VRMLCe+9D95ZdtZQ8bgY+r18sAVoIuWWjckKxv
         udxA==
X-Forwarded-Encrypted: i=1; AJvYcCUnkZaiZ5az+5y+A1aYVA8reT+zUvai50xNKmf+R2R3CU9xAWZWRdOKzee7fOOMRQ5VL6UeFqMvLWhD8qyAWQEvI7giOg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/+drCcKnVq8BL3vFi8d28c05c7dekFgbLg/wsyCf8F9dIcoCJ
	jS0EYaJorVSWwnTQQzL2pS1PsjoBwe5nppqJLtwXDjd1UllVKlmjLGmq3BegMmVdaG2Jr3RFC37
	fhfWLZDUv/HF0FTU+5JbMRBgR9Lszwm8=
X-Gm-Gg: ASbGncuq+2tJzdgN8kGqkCNVcS+06TsTFUqK0evtHU/rp+a0nVpw86akh+En9Yv6dTp
	xCoU/JdlB4p2ifaNkMDxy2bic9Q1mzqyoDlzoYWqHRc5Uo7FrAcKfDrT5Wei6UDpbKy40GPmMoF
	O4Uf3XV8MBInwPl0+0k2qMT/GQu+/cN30QwuFYXFjTEH5K8AfL8XquwWNBE6aBvdpfg9Cm2LVVG
	I1pmG1g4h1h6JRLD/DVSi0=
X-Google-Smtp-Source: AGHT+IF7yR8TLWdZv2iR76wMOEnBUAhFbb+Wlu2gwrj7g0DqD5585fO9/6fbqBQJsJwLWddBAL96wRMabRjRvTmlkwY=
X-Received: by 2002:a17:907:7f24:b0:adb:229f:6b71 with SMTP id
 a640c23a62f3a-ae9cddb1d86mr811165766b.5.1752772782364; Thu, 17 Jul 2025
 10:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717115936.7025-1-suchitkarunakaran@gmail.com>
In-Reply-To: <20250717115936.7025-1-suchitkarunakaran@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 17 Jul 2025 10:19:28 -0700
X-Gm-Features: Ac12FXwUFRH32wJkU9vAEP0Pbh4sI4UAGAlSrErRxYicCr0UK-kVl1OC2kUKGHY
Message-ID: <CAEf4BzZ+OTkaXmtWPbOGB0OWz5xmj-d06UWchooO+iUyDHar4g@mail.gmail.com>
Subject: Re: [PATCH] libbpf: Replace strcpy() with memcpy() in bpf_object__new()
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, bpf@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 4:59=E2=80=AFAM Suchit Karunakaran
<suchitkarunakaran@gmail.com> wrote:
>
> Replace the unsafe strcpy() call with memcpy() when copying the path
> into the bpf_object structure. Since the memory is pre-allocated to
> exactly strlen(path) + 1 bytes and the length is already known, memcpy()
> is safer than strcpy().
>
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> ---
>  tools/lib/bpf/libbpf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index 52e353368f58..279f226dd965 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -1495,7 +1495,7 @@ static struct bpf_object *bpf_object__new(const cha=
r *path,
>                 return ERR_PTR(-ENOMEM);
>         }
>
> -       strcpy(obj->path, path);
> +       memcpy(obj->path, path, strlen(path) + 1);


This is user-space libbpf code, where the API contract mandates that
the path argument is a well-formed zero-terminated C string. Plus, if
you look at the few lines above, we allocate just enough space to fit
the entire contents of the string without truncation.

In other words, there is nothing to fix or improve here.

pw-bot: cr

>         if (obj_name) {
>                 libbpf_strlcpy(obj->name, obj_name, sizeof(obj->name));
>         } else {
> --
> 2.50.1
>
