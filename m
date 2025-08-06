Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DC928A1E7
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  6 Aug 2025 15:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754494468; cv=none; b=KLzjvZE8nXD1urIDhsnwafdd8OLpBipYXoPY+zHkS7K3DH2GUR3s9DmIfYiwPgCYpsYV8XjcMFiLHmmEaIU9Wvt7wchZLxdXlTY2qTbwdtJSu1PUFgJJEZBIuFTVRACVkOydaNTqsXqMrBMnQf9gyfgD2+e4PBmIBpy9n7+qm0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754494468; c=relaxed/simple;
	bh=9k5FqnoKkgBQy4Bx9d/Hz1VRfIa6e+0sJLuBBqzZUKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=elcrqjRiNvyB6S4bj1owW20MrIIsZz/XEQfCnDk5BAWvM0hMQYqVHH6mBlTyreqBIzr/idisDOQu81mTqvKbWO9sCnQoUDEOu/EXvotN8/Y/rS7ODDvNf566au9YmyHne3gnKkG3UaNTYZ102PGv0tRD7WW/8RLX+lR1dnefuyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krfFQDFc; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krfFQDFc"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso7439262e87.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 06 Aug 2025 08:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754494465; x=1755099265; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dr2iD/x5RNPmf2/wZEirrgdGMAy27l5lk2Wo0A6tpXk=;
        b=krfFQDFcThfehhysBSb+1rlZu1+aYucw5WpWPQ11ZuQA5cK31vfLUEcYjKxSvLlf8U
         WPQcdT77onEiI1VTwYYTIsXUyNAS+vJ/tcTs7JfLj/t03JE413ygHZxGyUu6TXm5EPH2
         cMZu2vjNO8Z5B7tDexMlp5vCxV/EH/VLKYq9Djk0nho+eOFc8xl6to5bYnNGAHA3SCkC
         Ks3N2t2FfF8OA1h5BY5lWeWgjFkMBrCGreNox7ebKLEgZUqKlOZd7bMuX8DoCj8ed/7G
         0MMo4NhZqqYQXqbxmscJBu5DqSlve4E6clrnulUgUC/MGsUqASuIAjcGBYmZrK92e+PF
         zRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754494465; x=1755099265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dr2iD/x5RNPmf2/wZEirrgdGMAy27l5lk2Wo0A6tpXk=;
        b=ZY17MnsjA2wJWkPCeMa7S5+RwRvgYDJx6eAtase6tPoXHCMQKlM3S9qVsiZbSk77PI
         waxtZ1ckGtvDDg/NmrUUGrMj45O5YVouP+7W9mbKa6dCX16NOYHEojpSI9aLcSI2Rrf2
         QFevDCfKhQfMWMDEDh4bAW75iKTNQlpa0jvl99Q/70vgoysAOYGjDmRhWBFE4dEtvepT
         aaYPJoU2It6jQzfuLPkQwnRXxLbO9hDXMKlX7EOqsH8pbvP2a1+RHVk/e7F6QI+XGcig
         louibiPVBXnHajjRB+x7Zy7fbJC7Q/VKNMwL9/eTKQpzp7C/CVWJG/UQcIpCmnnaAeF4
         JAvA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ6SzE1+/A87/Lur3Fk+gnAVO4YxHPzlFpvA5G894WFtKWGjMpXH9U4VBn/IRbtqZ73SzRGDSeLX+B8bBUWrFyizVZkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxU+NS94YIwuSjtnmUfwfz/Zr/kmD0xXdOEToCLne5B5Kp07Re/
	thoEvopWlC0+8B28/nZTsoMPZ42COqt5HGTwV7h6o8/sFkVT6u82mg0W/Q+C/qT78sruEy6APwl
	tAZHdg0EHhQMqi34TLM9xCAtlRAOTznY=
X-Gm-Gg: ASbGncuuo44LaM3J6xmtZZnGxUngJ4+PQ6RtycSYAmJh7fkJJXagLRMVhVi9gw23dNX
	Q7+HWDJI9vj2xh5Vws1pStXlSJhLQyDbmIJvyfNt/FRb0E+zCor29KVFqm68XdNQpnjiEZHBCJ+
	8VjFMnUHknvZ0pcVYq08vT93m0+FPyPhFwfpYDxlVLXurX10Q0FihdDuXPQPMgUuuu6CNYR3Vr0
	STW5IQlRphOvbiFejO6FRsfdV0l5OuaFkuH1iWEvg==
X-Google-Smtp-Source: AGHT+IHzYnj2t0StXyiHnTT7AmBDLHvyVs5VmB+AUx/CTQwaqmFE5NjD51Ls4fjvngJ3ybeRwbshDtvTMQF8qgnMbII=
X-Received: by 2002:a05:6512:3c8e:b0:55b:8f40:32bd with SMTP id
 2adb3069b0e04-55caf34c5bfmr1035444e87.33.1754494464775; Wed, 06 Aug 2025
 08:34:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250806082016.14891-1-pranav.tyagi03@gmail.com> <20250806082933.4c1240c1@kernel.org>
In-Reply-To: <20250806082933.4c1240c1@kernel.org>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Wed, 6 Aug 2025 21:04:12 +0530
X-Gm-Features: Ac12FXyFmqPogFZVuBbAAVtJwDwboWX38L2kXniEux0YesnBsfKWjaAg2UPcZOc
Message-ID: <CAH4c4jKB_oTHDN6tp_ujBY_mNOyY_J60RrNFiFKXf=H_OCMPEA@mail.gmail.com>
Subject: Re: [PATCH] selftests/drivers/net: replace typeof() with __auto_type
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, shuah@kernel.org, dw@davidwei.uk, haiyuewa@163.com, 
	axboe@kernel.dk, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 8:59=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed,  6 Aug 2025 13:50:16 +0530 Pranav Tyagi wrote:
> > Replace typeof() with __auto_type in iou-zcrx.c.
> > __auto_type was introduced in GCC 4.9 and reduces the compile time for
> > all compilers. No functional changes intended.
>
> Yet another unnecessary compiler feature. Please no.

I understand. Thanks
