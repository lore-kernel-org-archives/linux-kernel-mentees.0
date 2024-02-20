Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E28C57877
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Feb 2024 06:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708409192; cv=none; b=aBQnHGR/iMRKtmT+ARmBVKPaHWJzUyOSI+XLdM8ALVdB45oOd6hgEOY37mrfeixyxLrvfFlOPwc9eYgjBJ0Zrtap0qdesP2ajhmW0CHt1KoCwWSupIieMsXulIS6ZKme+rvSs/O+qTlaaffOSvewoHfIiwgZDpwxsGl6foNMY+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708409192; c=relaxed/simple;
	bh=HRoyqvQLVi4WFKr3tIWp53Z+bTcdYuSeReEJyct0SC0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=QtGueis2ezo+sTBIowHwR34PdqXzfPSMP8TLAjpCefG/+pCcy5In5MV86ZJx5oRsuW14zrx3bFEi9GkI+/RLBckrEPxbntt+Kb1b4YH+CgClRPPHviFxRit7FJM6x/P57PHgThVL0SAbaN4jmtYLbWJv67Vb2A64Qxlq381UlNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhOPtW0L; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhOPtW0L"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE0CF408FB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Feb 2024 06:06:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a0rO1usWgxRe
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 20 Feb 2024 06:06:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c33; helo=mail-oo1-xc33.google.com; envelope-from=zhangwarden@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75FC94056F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75FC94056F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AhOPtW0L
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 75FC94056F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Feb 2024 06:06:29 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-59cb1e24e91so1653620eaf.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Feb 2024 22:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708409188; x=1709013988; darn=lists.linuxfoundation.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuPNDUsn2g63ljCiGs3HN8gRhcuFMB/bOTt6lSEB+pM=;
        b=AhOPtW0LKWoJ1LZbTXe+zvnQsTOQzx4X8HjKXdKEchdQA+iNdUN87EWM54F8+BQvsJ
         hEa8kFhTu2ZqWQEcFYJP5AQNHeaQpS851vlXOuMZGtYT5ulkAKwLtqq5+xiI3N9UI+A8
         F9HmnnbFlrllAnR2OlGtHiSZ5aD9dLhfco3lq9R25h6012UQgjsHZc7Kki1jIX/IFsTi
         G2Jr6n/5gH3YomawdUmaPwVXNDvDTwNUjA8YKpbg+AgQh4+t7fjeLP7hpKoHYvrte4PA
         g45fe/hXsVKviJtyVE6/UFFEgI8REluflgsL04CAkrCOq0k1hC6H+WdO4l3+EgDGVPSQ
         UuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708409188; x=1709013988;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuPNDUsn2g63ljCiGs3HN8gRhcuFMB/bOTt6lSEB+pM=;
        b=HdOvvQQGxL59UETlVCLcVtm2prT3xCrGUkuD9ywc1BVL7HLt+eW3YjW8tVz0hcYN0Q
         7Nzd5T9OUWj0MIIkjxTxhgqfhjojFoS1W9B95SYB3emY/ZkNSyV+i1xspczjuYCtL/hk
         8KpPIYzwTGC1M3Vd2/rsdC+QqdxKYAlYL7rEeCGB4zxVD+Ol1KgOXP1VEfUpQ51/BBjY
         aQP7b/sINLxcQHUGtmmox8O/mr3ZJKqu0hp0WxWKT6Lt6MOJJXnDd3TtczZLIFLigXaJ
         JVzPv7z1M3/a/koRORXk3N7OeWRiPARSQwpS7g4cG6hbpsDm3kLMQeDJ7Lz2IgMq3w/h
         jHfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbnANjTWlU1aHT/6sRnbjtym4Yd18IzXnN+SDAQGAqv/YeOeupWROHC2Zv27OnBm2STBDI5y9dXgdJo0B871aYtd0UhOtagtr/BstbYa1vWdEhNxKXw26Z4Kmuzim2
X-Gm-Message-State: AOJu0Yx1gS6kPv4n78N4+p2iOSLbV8ZnIIYKYS9TIAYYfMfFgYPQMOc+
	T4XzG+fLPecXZmdD1a7uKa6T9rEUTB4qbPuayyxTMoEjsoADeU6g
X-Google-Smtp-Source: AGHT+IH8VKVuo4wYWX+6PI1EIdanUEV2FcuwXJEzsfnMA0obmXxjMtO28LrKmVjUkqOCMnzm2CCRXQ==
X-Received: by 2002:a05:6358:63a7:b0:175:4f0f:bbb6 with SMTP id k39-20020a05635863a700b001754f0fbbb6mr10300972rwh.25.1708409187955;
        Mon, 19 Feb 2024 22:06:27 -0800 (PST)
Received: from smtpclient.apple ([47.89.225.180])
        by smtp.gmail.com with ESMTPSA id s42-20020a056a0017aa00b006e4736817c7sm1587115pfg.64.2024.02.19.22.06.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Feb 2024 22:06:27 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH]     Fix implicit cast warning in test_klp_state.c
From: zhang warden <zhangwarden@gmail.com>
In-Reply-To: <20240219141606.6711-1-mpdesouza@suse.com>
Date: Tue, 20 Feb 2024 14:06:10 +0800
Cc: Shresth Prasad <shresthprasad7@gmail.com>,
 jpoimboe@kernel.org,
 jikos@kernel.org,
 mbenes@suse.cz,
 pmladek@suse.com,
 joe.lawrence@redhat.com,
 shuah@kernel.org,
 live-patching@vger.kernel.org,
 linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <FD18B42B-6B73-4B55-A9B2-272414531C26@gmail.com>
References: <20240219141606.6711-1-mpdesouza@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: Apple Mail (2.3731.500.231)

Well, the repo location I use is =
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git.
It seem klp_get_state return struct klp_state.
The definition of this function in my repo as follows:

struct klp_state *klp_get_state(struct klp_patch *patch, unsigned long =
id)=20
{
    struct klp_state *state;

    klp_for_each_state(patch, state) {
        if (state->id =3D=3D id)=20
            return state;
    }  =20

    return NULL;
}
EXPORT_SYMBOL_GPL(klp_get_state);

Are you sure there is really a need for forced conversion?

> 2024=E5=B9=B42=E6=9C=8819=E6=97=A5 22:16=EF=BC=8CMarcos Paulo de Souza =
<mpdesouza@suse.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Sat, 17 Feb 2024 04:21:26 +0530 Shresth Prasad =
<shresthprasad7@gmail.com> wrote:
>=20
>>    The function `klp_get_state` returns an `int` value, but the =
variable
>>    `loglevel_state` is of type `struct klp_state *` and thus does an
>>    implicit cast. Explicitly casting these values fixes:
>>=20
>>            - warning: assignment to \u2018struct klp_state *\u2019 =
from \u2018int\u2019
>>    makes pointer from integer without a cast [-Wint-conversion]
>>=20
>>    on lines 38, 55, 68 and 80 of test_klp_state.c
>=20
> I was unable to find where you saw the klp_get_state returning int. I =
tried
> searching at the current master of live-patching repo[1], on =
linux-next. Can
> you point where do you saw it? For me, klp_get_state return a pointer =
to klp_state.
>=20
> Thanks,
>  Marcos
>=20
> [1]: =
https://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching.=
git/tree/kernel/livepatch/state.c
>=20
>>=20
>> Signed-off-by: Shresth Prasad <shresthprasad7@gmail.com>
>> ---
>> .../selftests/livepatch/test_modules/test_klp_state.c     | 8 =
++++----
>> 1 file changed, 4 insertions(+), 4 deletions(-)
>>=20
>> diff --git =
a/tools/testing/selftests/livepatch/test_modules/test_klp_state.c =
b/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
>> index 57a4253acb01..ae6b1ca15fc0 100644
>> --- a/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
>> +++ b/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
>> @@ -35,7 +35,7 @@ static int allocate_loglevel_state(void)
>> {
>> struct klp_state *loglevel_state;
>>=20
>> - loglevel_state =3D klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
>> + loglevel_state =3D (struct klp_state *)klp_get_state(&patch, =
CONSOLE_LOGLEVEL_STATE);
>> if (!loglevel_state)
>> return -EINVAL;
>>=20
>> @@ -52,7 +52,7 @@ static void fix_console_loglevel(void)
>> {
>> struct klp_state *loglevel_state;
>>=20
>> - loglevel_state =3D klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
>> + loglevel_state =3D (struct klp_state *)klp_get_state(&patch, =
CONSOLE_LOGLEVEL_STATE);
>> if (!loglevel_state)
>> return;
>>=20
>> @@ -65,7 +65,7 @@ static void restore_console_loglevel(void)
>> {
>> struct klp_state *loglevel_state;
>>=20
>> - loglevel_state =3D klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
>> + loglevel_state =3D (struct klp_state *)klp_get_state(&patch, =
CONSOLE_LOGLEVEL_STATE);
>> if (!loglevel_state)
>> return;
>>=20
>> @@ -77,7 +77,7 @@ static void free_loglevel_state(void)
>> {
>> struct klp_state *loglevel_state;
>>=20
>> - loglevel_state =3D klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
>> + loglevel_state =3D (struct klp_state *)klp_get_state(&patch, =
CONSOLE_LOGLEVEL_STATE);
>> if (!loglevel_state)
>> return;
>>=20
>> --=20
>> 2.43.1
>=20

