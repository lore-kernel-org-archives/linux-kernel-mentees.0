Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B077E302CBF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Dec 2025 06:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764830229; cv=none; b=De3Wf5BHyw1lxwUIUAt+jBYcgyqiH5/R9iDRZdVzO1/+pNoHcQb6UU0bCYhRJvUrU0zA8PudxpCZs08M3QLfig+eAD5VoSBIwwAz9lsW9H55tCs0s2TcQ0rwsKOau0/6n+/N11IBFrubtI0sZMoM7VDt28NXGArJ05o9yn/5zdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764830229; c=relaxed/simple;
	bh=rlvpXp4vXIUjCAdr/hHyOvzOZjcIFPmn9CfhMS22lG4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ULfQtfDTveKKcWpqJqAv87S4fUTwgOA4JxoNaZTMLgBcTvzn6tcHY/6fBLBnk8myYfEsSZdQTCXHFeSnIx5eH6H6T1zNikZNEb46j66+ZtfWVy+Ec5yQGlcqBU6LhAm3E2dH9kO/hKZfGhUapRWobB5W5yyjP7HecfeBwXAEht0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=StJy3Emb; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="StJy3Emb"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4688F4049B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Dec 2025 06:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GwBkW5uAMR6U for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Dec 2025 06:37:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=gmonaco@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD6FB40499
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD6FB40499
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=StJy3Emb
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DD6FB40499
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Dec 2025 06:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764830223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rlvpXp4vXIUjCAdr/hHyOvzOZjcIFPmn9CfhMS22lG4=;
	b=StJy3EmbCL0lj9/R8oPJ5DuCDm/Z1jRSc7/JG9I5VFviS4XwvHlx2JHTHq0TliVmVILfhJ
	TetVGISOFYSlo9WDWXqEiBBYcCJMxeR7Q3opqIqjr+n7UotoxqZmhh4QXmi8UlPaSQsIPE
	FCO/XdLu4+7IGQLcnDHmLM5nB+/n/Rw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-4aec0hL5MhS7jMCwVbmd0w-1; Thu, 04 Dec 2025 01:37:01 -0500
X-MC-Unique: 4aec0hL5MhS7jMCwVbmd0w-1
X-Mimecast-MFC-AGG-ID: 4aec0hL5MhS7jMCwVbmd0w_1764830220
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-42e2e50cfaeso387989f8f.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Dec 2025 22:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764830220; x=1765435020;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rlvpXp4vXIUjCAdr/hHyOvzOZjcIFPmn9CfhMS22lG4=;
        b=FsFjnRQOyDiDfTF5ZHatlKSbsDcWdV7NxyrSNd0QtD1TR8RlMMjCR4f3Gem4Lcjf1h
         Ty57ugJrGcp37TR2WYXJNKlCN2Y1h/BEfSAgF5TTxBRD5yTWxJXp98ChAXjnX0mrc7so
         sxqeKLXj1GgBeQa0IzAuo65cO9yYFPcj7rxT81xajkPjUU7Eq9Gn+DYkVcDthHx7J4aI
         2EpHczpWN3At5ZeZXfdjSbXDm6nTqcy0nxlnUSzVbznfYS6s5HVu02FZmy1d9lbOP5qq
         xryjlOyuf7poepAJLmQaTxgLnwa8HWxLp9ei1OERV73+kQQrFmQWnwJFaNKB6G3KF4pl
         NL3g==
X-Forwarded-Encrypted: i=1; AJvYcCUZqIbxwQjKajSCE066PZlNkshlGZoU2HwKOfYYsysWjpLFuM0VOYkz21Gp0hYRIfRPG9+/ICcSyn3sAJEzEEZsLdWaJg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyGEbbPbvr2jP1HT9AF5mG2Ncd44CKZ+IwhHMegRvq0bxAST6AN
	4thLEubUd4Ihg4AtgjrhbLYJj5GKJEOn+wtVyLgwx703zRANCZxaz97GZwzpzgutAKatwJ4kIjE
	L+E1xXAC5IU1Vcj5ZltiKctY/vIs4b1Nv/HQyyGPKlcaOm7egCgysjC/pyJFIqt0ngBnUlh0WfI
	ykONEgMLdvxhXBtg==
X-Gm-Gg: ASbGnctuzmToqNUi7SJnnHLqYulQBK5KmoFc6/NRMBZUcrEiaHZbTDtZ7VOEf2XzWOe
	r2AKGMeTxZ+8OItL3/gCTxgOOx+AsBerD5ACozsJKH1vNwzIxHlnUrTbblzWxALsPDAYCGDg1M2
	2Gcb/OCArmibKRVTsEcdngw6C5HaGamQGaZamzaOivjQPm/OmdZVNlz5tsr/6A8JWs6H+mHiwSo
	MESWqCiC4da1FA41fJKJlA4IozlCZK2VufkfvP85rAyqATeUovWYHt3H86vxIt3rKuCPXw0hx4f
	OAX95dL2V/GtVjVSa5uRZvjS2LioULqmPKNi+hXSa2RuMbBHjAOL+Dp2Chga5QkZGgqbYCS6HJO
	YnlGF/9ieLCUJlzo+YucAiLULqmV9myJynls=
X-Received: by 2002:a5d:5846:0:b0:429:8daa:c6b4 with SMTP id ffacd0b85a97d-42f797fdfccmr1428243f8f.21.1764830220222;
        Wed, 03 Dec 2025 22:37:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVv89Dh0h6k8CSTD9tgFWXKJrlyWPOh6eQ1WXkpbNGabqnJgqBAuEpWofqbE43M3jSFyUU6A==
X-Received: by 2002:a5d:5846:0:b0:429:8daa:c6b4 with SMTP id ffacd0b85a97d-42f797fdfccmr1428210f8f.21.1764830219788;
        Wed, 03 Dec 2025 22:36:59 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeae9sm1381076f8f.13.2025.12.03.22.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:36:59 -0800 (PST)
Message-ID: <a34546391cc59f9f880ec271292ac201292bac61.camel@redhat.com>
Subject: Re: [PATCH v3] Documentation/rv: Fix dead link to
 monitor_synthesis.rst
From: Gabriele Monaco <gmonaco@redhat.com>
To: Soham Metha <sohammetha01@gmail.com>, 
	linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org, skhan@linuxfoundation.org, rostedt@goodmis.org, 
	namcao@linutronix.de, mathieu.desnoyers@efficios.com, mhiramat@kernel.org, 
	bagasdotme@gmail.com, linux-kernel@vger.kernel.org, Jonathan Corbet	
 <corbet@lwn.net>, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Date: Thu, 04 Dec 2025 07:36:57 +0100
In-Reply-To: <20251204032452.9523-1-sohammetha01@gmail.com>
References: <20251204032452.9523-1-sohammetha01@gmail.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aIvMKi2nQ3HLlOCD1yvqVS-v1ajt00nlxNoUg23W3X8_1764830220
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-12-04 at 08:54 +0530, Soham Metha wrote:
> The file 'da_monitor_synthesis.rst' was renamed to 'monitor_synthesis.rst=
' in
> commit f40a7c06020709
> ("Documentation/rv: Prepare monitor synthesis document for LTL inclusion"=
).
>=20
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>

Thanks for catching this!

> ---
> Changelog:
> v3:
> - use a 14 character commit hash
> - unwrap Code Blocks so that the references can be linked

You may want to add this to the commit message next time, you are in fact n=
ot
only fixing the broken link.
Since the change is small I wouldn't bother this time, though.

> v2:
> - Use proper commit SHA reference syntax

I suggest you run your patches through script/checkpatch.pl (in the kernel
tree), it's usually finding this kind of formatting issues and even more be=
fore
you even send it.
On a side note, apparently it wouldn't have worked this time since you quot=
ed
the hash.

Anyway looks good to me.

Acked-by: Gabriele Monaco <gmonaco@redhat.com>

Thanks,

Gabriele

>=20
> =C2=A0Documentation/trace/rv/da_monitor_instrumentation.rst | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/trace/rv/da_monitor_instrumentation.rst
> b/Documentation/trace/rv/da_monitor_instrumentation.rst
> index 6c67c7b57811..9eff38a4ad1f 100644
> --- a/Documentation/trace/rv/da_monitor_instrumentation.rst
> +++ b/Documentation/trace/rv/da_monitor_instrumentation.rst
> @@ -162,10 +162,10 @@ For example, from the wip sample model::
> =C2=A0
> =C2=A0The probes then need to be detached at the disable phase.
> =C2=A0
> -[1] The wip model is presented in::
> +[1] The wip model is presented in:
> =C2=A0
> =C2=A0=C2=A0 Documentation/trace/rv/deterministic_automata.rst
> =C2=A0
> -The wip monitor is presented in::
> +The wip monitor is presented in:
> =C2=A0
> -=C2=A0 Documentation/trace/rv/da_monitor_synthesis.rst
> +=C2=A0 Documentation/trace/rv/monitor_synthesis.rst

