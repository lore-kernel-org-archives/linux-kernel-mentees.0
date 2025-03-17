Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AAD1C5489
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Mar 2025 17:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742230873; cv=none; b=qITc2V+dBACLhDdkQxqe9Rvxe0NfF55Zwh1OisJIooSdYB6nnWHAoufX6QkHzSMLoajYYqn4S3iWiFSh5RZc0SfR/jXxCzFWINLbQBVGrTWoogK++AQ1n/5Ku6PaaQMfycdl0RaF1IjXDAcTxx+sH0XaNdzaLarPq9aTwcEGTPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742230873; c=relaxed/simple;
	bh=sHArdzCJ7OJGYmSrli5/QOc0LfBoQ1QCQ+1FM37WWf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQBTpqRPYkQxrHejz4W8tpH/VyJXCo2XzU7xsGAMvV2r+YT7N88wZkCsIwVAspba1DFwm8E4zEgyEDk1iz19Gyjq+c3D3FpS+0bOGos4mFgEyflr1/hviddRWnuGGJupW7WJkwpzjipOrkKJXn7GsnyE4hgHODlP2gijm2cDK2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=semidynamics.com; spf=pass smtp.mailfrom=semidynamics.com; dkim=pass (1024-bit key) header.d=semidynamics.com header.i=@semidynamics.com header.b=GPaltrkI; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=semidynamics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semidynamics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=semidynamics.com header.i=@semidynamics.com header.b="GPaltrkI"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-391295490c8so467272f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Mar 2025 10:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semidynamics.com; s=google; t=1742230869; x=1742835669; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=03Tvy48TmAOS+7xyYgaARhLkJjCoqndvpt94zVo46wA=;
        b=GPaltrkIbaztSMkSN7T4cgJRkD/8EeC+xjTQdIzMAnbTD4NMyxDII+uCOMIRj3x4dO
         wmLx2UVaRRq5dOwczODFR9WlV+DIUYOr2gmX8Q7hAkeKqhIm8sqAb4DJExKy95ZMZQot
         Jc+l6aEUu//zZEksymvfYIF90/p8AG+IGIFKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742230869; x=1742835669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=03Tvy48TmAOS+7xyYgaARhLkJjCoqndvpt94zVo46wA=;
        b=MtHz24XqlPseaxCBnfpFsYCLHhUb+W280QPgKR7XJeoDiU8WMnNwsauJs5icAGivHM
         gQ/6Js92waFl6NsNcYUMnYY0COj2UbE0S0JgImVyqsQktoqLqUdJUnM/iWfOOOqw8dKg
         YxB9Xl0VPjHFJG7REYz5X9QKC0WwIII2dye5Ir0G0d0kn9+kMNHCChbC4jxi7OFXXVWJ
         YK0RHLjkcNlLR9vg7+EWcmaM7QSWhDbeqhA47IQAgdJxRnW+33w6zhRvjv6jsS8Ay5cX
         E/qkHYxaSaE2Lkxd6/hCFbCr+Vosh4NmQEbf9SgoeqDYnEzBmuOBtJZHlrMLWa27PMNA
         cb3Q==
X-Gm-Message-State: AOJu0YzkbP7kPgCbv9duus32kDet5F1JzHYwtB700UvKBZMOHUy/Hqu5
	LvmQZgvLgLkQ8IhJkiPZDOuNBPWErJNGueot8KCAgJ++KcGjVNDl7lhfhj0AV1c=
X-Gm-Gg: ASbGncuyT4OO4y7Ma7ZlO7QK/CwivzMW0Apyekoqw4ExzMsXEwAjvTbg4Sg48lUNsEd
	gOl70+Nx/5OR9+d8pruH1hNypUJPxZvavQibgWx/SHOejUkXjZxy+/+fatvnS3cqtI1WETuJq53
	eFhGBVHfCwgYudVELDasucHYnlwVliAQ8YThyK4mfnSv3NL5wT3MMreEARMyWGIdLOxO9lOXbRJ
	2e4WmZ8eN70bfTvFGKIhPZMehriIOijOw8TyrOxDfiLvTA0lyLuZVaz5CjJaqRICH8d2zxV2rwj
	wbXgANE0Nr/O1CkjvIezIcZ5Z+MY04fotvSoV1erdGFi9imTinMGP2KKAQjII2pZ5+qLn1A3eIj
	ZHCgmmMlBQGCuOVxVByvr3S1RpVPcC38ROg==
X-Google-Smtp-Source: AGHT+IEsx4LguvEPk377tGVp1MsuI/r0EPZ4Ta/6mmlTKMUYfLpwjbwVZT7dwz9Y0SbEIi90HwutDg==
X-Received: by 2002:a05:6000:1568:b0:391:cd7:82f2 with SMTP id ffacd0b85a97d-3971e2ad5bfmr5169031f8f.6.1742230868767;
        Mon, 17 Mar 2025 10:01:08 -0700 (PDT)
Received: from [192.168.1.46] (216.red-79-152-37.dynamicip.rima-tde.net. [79.152.37.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df339asm15330446f8f.3.2025.03.17.10.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 10:01:08 -0700 (PDT)
Message-ID: <0807e0cc-457b-49bd-bce5-a961ad7f0ffb@semidynamics.com>
Date: Mon, 17 Mar 2025 18:01:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] 9p/trans_fd: mark concurrent read and writes to
 p9_conn->err
To: Dominique Martinet <asmadeus@codewreck.org>,
 Ignacio Encinas <ignacio@iencinas.com>
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov
 <lucho@ionkov.net>, Christian Schoenebeck <linux_oss@crudebyte.com>,
 Sishuai Gong <sishuai.system@gmail.com>, Marco Elver <elver@google.com>,
 v9fs@lists.linux.dev, linux-kernel@vger.kernel.org,
 syzbot+d69a7cc8c683c2cb7506@syzkaller.appspotmail.com,
 syzbot+483d6c9b9231ea7e1851@syzkaller.appspotmail.com
References: <20250313-p9_conn_err_benign_data_race-v2-1-0bb9f45f6bb2@iencinas.com>
 <Z9dBfEf0naCsNrNv@codewreck.org>
Content-Language: en-US
From: Ignacio Encinas Rubio <ignacio.encinas@semidynamics.com>
In-Reply-To: <Z9dBfEf0naCsNrNv@codewreck.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/3/25 22:24, Dominique Martinet wrote:
> Ignacio Encinas wrote on Thu, Mar 13, 2025 at 07:08:19PM +0100:
>> Changes in v2:
>>
>> Drop unnecessary READ_ONCE in p9_fd_request (that I added in v1)
> 
> Ah, sorry; I think you misread my comment for v1 (or perhaps you
> disagreed in the response and I misread that!)

Yeah, I disagreed. Sorry about the misunderstanding. As these are not
strictly necessary I thought it would be best to not add them.

> I was thinking that style-wise it's better to access the err field
> through READ/WRITE_ONCE everywhere, even if it's locked; so suggested
> this diff from v1:
> ----
> diff --git a/net/9p/trans_fd.c b/net/9p/trans_fd.c
> index f163f6fc7354..65270c028f52 100644
> --- a/net/9p/trans_fd.c
> +++ b/net/9p/trans_fd.c
> @@ -192,7 +192,7 @@ static void p9_conn_cancel(struct p9_conn *m, int err)
>  
>         spin_lock(&m->req_lock);
>  
> -       if (m->err) {
> +       if (READ_ONCE(m->err)) {
>                 spin_unlock(&m->req_lock);
>                 return;
>         }
> ----

Got it. I'll follow your recommendation for the v3. I'll reflect it in
the commit message just in case someone does a git blame and wonders
about these couple of READ_ONCEs.

> 
> OTOH, looking at this again:
>> --  if (m->err < 0) {
>> -+  if (READ_ONCE(m->err) < 0) {
>> -           spin_unlock(&m->req_lock);
>> -           return m->err;
> 
> There's this access out of the lock so perhaps this should look like
> this instead (with or without the READ_ONCE)
> 
> +       err = READ_ONCE(m->err);
> +       if (err < 0) {
>                 spin_unlock(&m->req_lock);
> -               return m->err;
> +               return err;

Oops, this is embarrassing... Thanks for catching it.

> Anyway, m->err is only written exactly once so it doesn't matter the
> least in practice, 

I think this one deserves a fix, I disagree :)

> and it looks like gcc generates exactly the same
> thing (... even if I make that `return READ_ONCE(m->err)` which
> surprises me a bit..), so this is just yak shaving.

This is weird... I'll double check because it shouldn't generate the
same code as far as I know.

> I don't care all that much so I'll just pick this v2 as it's more
> consistent, but feel free to send a v3 if you have an opinion, or if
> someone else chips in.

To summarize, my plan is sending a v3 with the couple of READ_ONCE you
suggested and fixing the unlocked plain access.

Thanks!
