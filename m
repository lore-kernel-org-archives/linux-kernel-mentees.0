Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F75B3D982
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Feb 2024 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708509590; cv=none; b=Os3ShXj4VDMZv1SpgBViOYxew1JAPHcdUfwOIVhviB/9yoHV55bM2yGSumq+LmoBFa6Vl1hX2Txw+qoqKj0eU1NepJJQepsRT6MyRBZVOgX5j1PiTro9CQCU5RwlrJP960+bgAdRU8si02CpfZyrk7i5juvHhE+cZ8V1wE5rSBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708509590; c=relaxed/simple;
	bh=5v3dtSCXtJMKznIfq4bOSd2Ajb7Xgfbqb6Og5lUaIsE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=TBC4VHH2XdzpCCz+wdYul97v/rLoUvaIx29J77DavGvMor5m6NIdl4yOl8vKmYWDjFBCB+GgAMNWF16IachHV7O61NCVIcl2Uk/QVAwmju5wyOK3+bbTEJmPdEnjncjrHI3lw8QynAVlde8VfHGdfLs+HsTeHePKq6eb4ETFxeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhG5a3q/; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhG5a3q/"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD30B40300
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Feb 2024 09:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W9qQ0I0lG_iD
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 21 Feb 2024 09:59:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=shresthprasad7@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A3FB402E1
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A3FB402E1
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XhG5a3q/
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0A3FB402E1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Feb 2024 09:59:47 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6083dc087b3so29272857b3.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Feb 2024 01:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708509586; x=1709114386; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5v3dtSCXtJMKznIfq4bOSd2Ajb7Xgfbqb6Og5lUaIsE=;
        b=XhG5a3q/fuI8eO6Ft0oK0xqZyAqC70yj3+/5aUTRNoSb5SKOD0ZTTTpyNJxOfY90xv
         wqTCZuGWGAPhXwKtrPn5onAiYUCD7WL00YoEGAgHvQxed46VLvhxe2dc6+yj/zAE+oUt
         vVJRp7QioOvAw5BE2riDvoRc62hbVx0iCnuiHDTMkBFsI708J06Jpm654z2kWwnlD5Vt
         i4RZdYGplMw6q7KWeFA0wavKdUutBEoucMx7yvsXceJ4/1P2f6W3P8zz0108Zwbztgjh
         xguDr0gq95TsOE2PKKHbeKb0rVPOkFrlTzubFdvgndTXIS88lGCTQ5e7faQSry1bHzJ+
         /Pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708509586; x=1709114386;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5v3dtSCXtJMKznIfq4bOSd2Ajb7Xgfbqb6Og5lUaIsE=;
        b=QIRlwzILEc66sOd4aVt7mOCkZBH3jvEwk3sE0eXoTVD1LBF0p/UjY5NMOeRgzI+NMp
         9r1sOZYEOEzFUxJgtXtGV5M5+z7rBs5lQlK6EN0z02I7m6AJ7zFiifGorwOzI6HwYWMj
         wzBbHrkT+NZpGYezKVQo+3tNfLVOUqJ27YCcj96xjG05EYiQ5YT+ZV3DnS2VCO7c3It4
         DVDtvbI/jdduO8/MPEy0OwcMFlL0RDTQOMPHS5jJVQk9p3WlTcSuGQyD4rHi+IkbaBfw
         lSp0j9YdvSfM/19WWlFUPt5s0c6fwjZ0JtiLscrFiuMMGUAby7pJXoXwiT0D9Rc/8Icj
         qN/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOWEvh8EzjjtTZUfH8f4YX2IjrbteH5WDPk3JDufcONqiWOJpZNKBu/0jAtLgnphQs7ipGZTo3cUC6QYrKGNGbuMy7ZWtMx16asnyj716w7Q+ARiSb+iGbg2DDvx5c
X-Gm-Message-State: AOJu0Yyr5gIN4FrhtXSYc07Oi6XQeLQbpCTmFQOF22375sodPF/9rd7U
	ODytW1D6oiEGLneqtvlbnJrXIfo56DqARsFovkixT+bcMJMQ2Nyn
X-Google-Smtp-Source: AGHT+IGayboSSYCRSBTfKt/p8uzubL1dQkldpRG0mhTDMp+YvZDPIeXz2+mtkKwMRQEU2KIbrXXU8Q==
X-Received: by 2002:a25:848d:0:b0:dc6:be64:cfd1 with SMTP id v13-20020a25848d000000b00dc6be64cfd1mr14423533ybk.36.1708509586648;
        Wed, 21 Feb 2024 01:59:46 -0800 (PST)
Received: from [127.0.0.1] ([106.221.238.184])
        by smtp.gmail.com with ESMTPSA id u29-20020a056a00099d00b006e0e3e44f33sm8396473pfg.103.2024.02.21.01.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 01:59:46 -0800 (PST)
Date: Wed, 21 Feb 2024 15:29:39 +0530 (GMT+05:30)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: zhangwarden@gmail.com
Cc: jikos@kernel.org, joe.lawrence@redhat.com, jpoimboe@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	live-patching@vger.kernel.org, mbenes@suse.cz, mpdesouza@suse.com,
	pmladek@suse.com, shresthprasad7@gmail.com, shuah@kernel.org,
	skhan@linuxfoundation.org
Message-ID: <ff1078b2-447d-4ae7-8287-d0affd23588d@gmail.com>
In-Reply-To: <B052E4A4-3652-452F-B4F9-F36860143CC3@gmail.com>
Subject: Re: [PATCH]     Fix implicit cast warning in test_klp_state.c
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <ff1078b2-447d-4ae7-8287-d0affd23588d@gmail.com>

I checked the source code and yes I am on the latest Linux next repo.

Here's the warning:
/home/shresthp/dev/linux_work/linux_next/tools/testing/selftests/livepatch/=
test_modules/test_klp_state.c:38:24: warning: assignment to =E2=80=98struct=
 klp_state *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from integer=
 without a cast [-Wint-conversion]
=C2=A0=C2=A0 38 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 loglevel_=
state =3D klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^
/home/shresthp/dev/linux_work/linux_next/tools/testing/selftests/livepatch/=
test_modules/test_klp_state.c: In function =E2=80=98fix_console_loglevel=E2=
=80=99:
/home/shresthp/dev/linux_work/linux_next/tools/testing/selftests/livepatch/=
test_modules/test_klp_state.c:55:24: warning: assignment to =E2=80=98struct=
 klp_state *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from integer=
 without a cast [-Wint-conversion]
=C2=A0=C2=A0 55 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 loglevel_=
state =3D klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^
/home/shresthp/dev/linux_work/linux_next/tools/testing/selftests/livepatch/=
test_modules/test_klp_state.c: In function =E2=80=98restore_console_logleve=
l=E2=80=99:
/home/shresthp/dev/linux_work/linux_next/tools/testing/selftests/livepatch/=
test_modules/test_klp_state.c:68:24: warning: assignment to =E2=80=98struct=
 klp_state *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from integer=
 without a cast [-Wint-conversion]
=C2=A0=C2=A0 68 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 loglevel_=
state =3D klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^
/home/shresthp/dev/linux_work/linux_next/tools/testing/selftests/livepatch/=
test_modules/test_klp_state.c: In function =E2=80=98free_loglevel_state=E2=
=80=99:
/home/shresthp/dev/linux_work/linux_next/tools/testing/selftests/livepatch/=
test_modules/test_klp_state.c:80:24: warning: assignment to =E2=80=98struct=
 klp_state *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from integer=
 without a cast [-Wint-conversion]
=C2=A0=C2=A0 80 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 loglevel_=
state =3D klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^

Thank you for your help so far.

Regards,
Shresth
