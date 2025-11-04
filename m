Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2811E5B7A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 00:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762216234; cv=none; b=jjUKleFrQ39mPMf9PskstAHNk32EeM7s0ztqkUWgqQCWnJnPxe9gACRYe8c8iLqvoVoBI2eVI2TuN2JqFFFA4WlOp22c5pQPdf8G4mSnRfBA7esOiK+NgKwADXGcEyIKIM77m6Faa+mil54AUTD8iHnMDQowC3Ex9GpFWSgelxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762216234; c=relaxed/simple;
	bh=CiLhLbG/M7HwnYjSqGUrPgkG+/V5ygCbc8QsfCLg1zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZeBNwgvpHgkjgx1xEcIWJUPGoCsjsN/6jnZgB/9PYkWnKTcVEfFv4+I1YwfeL8HWHNRcPzAh+pjDbO91TUdX6B9Xnvg9TI4VPONVPwoqEU7kcgqQb0tBegPWJUKy4xddqIFIN68xV5UMYmRfJy2pzkoEwSfemD32MHFSPp5XiM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QdyAVFZ4; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QdyAVFZ4"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AFAE406D4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 00:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aE7dMeZ-0lqO for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Nov 2025 00:30:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=kuniyu@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C64140141
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C64140141
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=QdyAVFZ4
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0C64140141
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 00:30:30 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2953ad5517dso34457535ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 03 Nov 2025 16:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762216230; x=1762821030; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqcCRqTl/qoCqnjiqKwU9PLeLoMNE7fr5oh2+DkTABg=;
        b=QdyAVFZ4CzZHkm0gnzUYUQYYTglt1+tR8654DbKzzUfLtktaR/nR9EwHBtsdxx4uLT
         g8iy+m0/5oGcl/ZAXGYojyH+r8RDh93Soh461AIBmfGsICT0Di5pIDyJK1+BIVN6h0HU
         LrghnyE6L8Yv0w4M8e3nNH0jxDTXtMtdBhhxP4Wf/M6mOCf0T1nbH+Ehi6y33QxKVp99
         F/2Q4bRWv5AImuTZ63MrRVYHENRiGaIHWL9iCzOMZ7Km3Yrml/TQbNe5EUfKaXelpd1k
         AdN1XEEAk0/8/UqB+cIz2nCnCz1DO3RIIc9/5vw//Ykl5DY1eja7BBEExfLi3uAjmO3m
         Z8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762216230; x=1762821030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqcCRqTl/qoCqnjiqKwU9PLeLoMNE7fr5oh2+DkTABg=;
        b=LJ9YyPRGaXsc23tyQPCkEGyY+G1aRFXmX3hLY1p9K8NAuiTqo5jl1jVpkzAZaVcXHn
         84YIHrVetyeu6r4q1rMmgHNCIcJ8BsKS9tU/Sgi0FvkOkRXXp5BU1FowNqoZvgs1GLwG
         VQ5JqtMQYAi9ojXxsnzu+4mDYbB/0E7/YyU7nBOoTnjPfZzfF6A5LsJqupA9eHb2e5YK
         tLdCe0YnjEiPn9kr9SIlipBuSzJCFTYMBrvugyfPpK7lTH7opPscHUloiaaDEg13SdNC
         zSRIsf7Cv6mjd+A4ZBglhVAKhE+2WGch4Mqu+Whs106dv6wT3Nlr1gmx95hjpvS71n1l
         lRNg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ1OQfCPRNIuVb2rlg0HDvqa9Wxw1ImYrxmromhU1tHflQKTHabSckPSBiFm2z2pFuRMxHuHrkrIPRZNS5q9eElgUEHA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyC+n7NJArRD7qlVMojRVL/nZEr9ymo4gRBbiMH4IXxZoz1WlWg
	nOG4vOXfsz0StLVt+gbPaIqy8R3od8L29TL3znkNP7P2be5SwpgMiz9NG+7KnWQHk8tVI2NCxdT
	wDI9XMlYliWjwhzsA5rKM7j8YPNgnEV8DQqWToXAO
X-Gm-Gg: ASbGncvKLq8ph6cUtXgLLFXeUMkGf3c66ZYH08ghGegwCeje4Dm2d3nCYDVKBQx54Zz
	ZDQs0eD4DqvMzIYCKS+aPz7J0akeaBlCu/KfNfHnwoOFxWX89fcXQq8mYM1vHiq99dJfQWisZPh
	5Wf/NrMqqgrCSqkI1NlmWN8sSBk0VzSG6G7RO7AiJZyyiX2Ab3GszQU1uN1VrVQCy/4bHQmGgKh
	TrgjqWfNLVAJzmWyPjc4vhePaYOeVQNqn2YgqJnr/tQqauL3jtzfpIAtYa9MBKR6tsWQAKtNuG6
	jPh+Jc7nkKcvvwoXVqIE1Szs5LKc
X-Google-Smtp-Source: AGHT+IF/TuzzM6UiR2btqhhnkzThmfNLPxoe+iiZUgfG0xqcwukxfOV9+GQogXuYNA/DvvkDwAKRLlZkf1zyd7gQ6dE=
X-Received: by 2002:a17:902:ea0b:b0:295:557e:746d with SMTP id
 d9443c01a7336-295557e7b03mr121283135ad.57.1762216229784; Mon, 03 Nov 2025
 16:30:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251101172230.10179-1-adelodunolaoluwa.ref@yahoo.com>
 <20251101172230.10179-1-adelodunolaoluwa@yahoo.com> <CAAVpQUDL1FB1nFYOZ6QuO+cGTqnpYNSaFtFD=YN742pyspe9ew@mail.gmail.com>
 <7a162b38-3ff8-4f97-aac3-4fe2ab50fe33@yahoo.com>
In-Reply-To: <7a162b38-3ff8-4f97-aac3-4fe2ab50fe33@yahoo.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 3 Nov 2025 16:30:18 -0800
X-Gm-Features: AWmQ_bnnGa6oY3iwc-ExLoQS270SjXZ6P7Ip3gcrLKuqdfofie0b35WwSthl_lo
Message-ID: <CAAVpQUADwghMj=SgdiZEErC5oy7RVpam4i9S2RwP19bA=Rbynw@mail.gmail.com>
Subject: Re: [PATCH v3] selftests: af_unix: Add tests for ECONNRESET and EOF semantics
To: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 4:08=E2=80=AFPM Sunday Adelodun
<adelodunolaoluwa@yahoo.com> wrote:
>
> On 11/2/25 08:32, Kuniyuki Iwashima wrote:
> > On Sat, Nov 1, 2025 at 10:23=E2=80=AFAM Sunday Adelodun
> > <adelodunolaoluwa@yahoo.com> wrote:
> >> Add selftests to verify and document Linux=E2=80=99s intended behaviou=
r for
> >> UNIX domain sockets (SOCK_STREAM and SOCK_DGRAM) when a peer closes.
> >> The tests verify that:
> >>
> >>   1. SOCK_STREAM returns EOF when the peer closes normally.
> >>   2. SOCK_STREAM returns ECONNRESET if the peer closes with unread dat=
a.
> >>   3. SOCK_SEQPACKET returns EOF when the peer closes normally.
> >>   4. SOCK_SEQPACKET returns ECONNRESET if the peer closes with unread =
data.
> >>   5. SOCK_DGRAM does not return ECONNRESET when the peer closes.
> >>
> >> This follows up on review feedback suggesting a selftest to clarify
> >> Linux=E2=80=99s semantics.
> >>
> >> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> >> Signed-off-by: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
> >> ---
> >>   tools/testing/selftests/net/af_unix/Makefile  |   1 +
> >>   .../selftests/net/af_unix/unix_connreset.c    | 179 ++++++++++++++++=
++
> >>   2 files changed, 180 insertions(+)
> >>   create mode 100644 tools/testing/selftests/net/af_unix/unix_connrese=
t.c
> >>
> >> diff --git a/tools/testing/selftests/net/af_unix/Makefile b/tools/test=
ing/selftests/net/af_unix/Makefile
> >> index de805cbbdf69..5826a8372451 100644
> >> --- a/tools/testing/selftests/net/af_unix/Makefile
> >> +++ b/tools/testing/selftests/net/af_unix/Makefile
> >> @@ -7,6 +7,7 @@ TEST_GEN_PROGS :=3D \
> >>          scm_pidfd \
> >>          scm_rights \
> >>          unix_connect \
> >> +       unix_connreset \
> > patchwork caught this test is not added to .gitignore.
> > https://patchwork.kernel.org/project/netdevbpf/patch/20251101172230.101=
79-1-adelodunolaoluwa@yahoo.com/
> >
> > Could you add it to this file ?
> >
> > tools/testing/selftests/net/.gitignore
> Oh, thank you for this. will add it
> >
> >
> >>   # end of TEST_GEN_PROGS
> >>
> >>   include ../../lib.mk
> >> diff --git a/tools/testing/selftests/net/af_unix/unix_connreset.c b/to=
ols/testing/selftests/net/af_unix/unix_connreset.c
> >> new file mode 100644
> >> index 000000000000..6f43435d96e2
> >> --- /dev/null
> >> +++ b/tools/testing/selftests/net/af_unix/unix_connreset.c
> >> @@ -0,0 +1,179 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Selftest for AF_UNIX socket close and ECONNRESET behaviour.
> >> + *
> >> + * This test verifies:
> >> + *  1. SOCK_STREAM returns EOF when the peer closes normally.
> >> + *  2. SOCK_STREAM returns ECONNRESET if peer closes with unread data=
.
> >> + *  3. SOCK_SEQPACKET returns EOF when the peer closes normally.
> >> + *  4. SOCK_SEQPACKET returns ECONNRESET if the peer closes with unre=
ad data.
> >> + *  5. SOCK_DGRAM does not return ECONNRESET when the peer closes.
> >> + *
> >> + * These tests document the intended Linux behaviour.
> >> + *
> >> + */
> >> +
> >> +#define _GNU_SOURCE
> >> +#include <stdlib.h>
> >> +#include <string.h>
> >> +#include <fcntl.h>
> >> +#include <unistd.h>
> >> +#include <errno.h>
> >> +#include <sys/socket.h>
> >> +#include <sys/un.h>
> >> +#include "../../kselftest_harness.h"
> >> +
> >> +#define SOCK_PATH "/tmp/af_unix_connreset.sock"
> >> +
> >> +static void remove_socket_file(void)
> >> +{
> >> +       unlink(SOCK_PATH);
> >> +}
> >> +
> >> +FIXTURE(unix_sock)
> >> +{
> >> +       int server;
> >> +       int client;
> >> +       int child;
> >> +};
> >> +
> >> +FIXTURE_VARIANT(unix_sock)
> >> +{
> >> +       int socket_type;
> >> +       const char *name;
> >> +};
> >> +
> >> +/* Define variants: stream and datagram */
> > nit: outdated, maybe simply remove ?
> oh..skipped me.
> will do so.
> >
> >> +FIXTURE_VARIANT_ADD(unix_sock, stream) {
> >> +       .socket_type =3D SOCK_STREAM,
> >> +       .name =3D "SOCK_STREAM",
> >> +};
> >> +
> >> +FIXTURE_VARIANT_ADD(unix_sock, dgram) {
> >> +       .socket_type =3D SOCK_DGRAM,
> >> +       .name =3D "SOCK_DGRAM",
> >> +};
> >> +
> >> +FIXTURE_VARIANT_ADD(unix_sock, seqpacket) {
> >> +       .socket_type =3D SOCK_SEQPACKET,
> >> +       .name =3D "SOCK_SEQPACKET",
> >> +};
> >> +
> >> +FIXTURE_SETUP(unix_sock)
> >> +{
> >> +       struct sockaddr_un addr =3D {};
> >> +       int err;
> >> +
> >> +       addr.sun_family =3D AF_UNIX;
> >> +       strcpy(addr.sun_path, SOCK_PATH);
> >> +       remove_socket_file();
> >> +
> >> +       self->server =3D socket(AF_UNIX, variant->socket_type, 0);
> >> +       ASSERT_LT(-1, self->server);
> >> +
> >> +       err =3D bind(self->server, (struct sockaddr *)&addr, sizeof(ad=
dr));
> >> +       ASSERT_EQ(0, err);
> >> +
> >> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> >> +               variant->socket_type =3D=3D SOCK_SEQPACKET) {
> > patchwork caught mis-alignment here and other places.
> >
> > I'm using this for emacs, and other editors will have a similar config.
> >
> > (setq-default c-default-style "linux")
> >
> > You can check if lines are aligned properly by
> >
> > $ git show --format=3Demail | ./scripts/checkpatch.pl
> >
> >
> >> +               err =3D listen(self->server, 1);
> >> +               ASSERT_EQ(0, err);
> >> +
> >> +               self->client =3D socket(AF_UNIX, variant->socket_type,=
 0);
> > Could you add SOCK_NONBLOCK here too ?
> This is noted
> >
> >> +               ASSERT_LT(-1, self->client);
> >> +
> >> +               err =3D connect(self->client, (struct sockaddr *)&addr=
, sizeof(addr));
> >> +               ASSERT_EQ(0, err);
> >> +
> >> +               self->child =3D accept(self->server, NULL, NULL);
> >> +               ASSERT_LT(-1, self->child);
> >> +       } else {
> >> +               /* Datagram: bind and connect only */
> >> +               self->client =3D socket(AF_UNIX, SOCK_DGRAM | SOCK_NON=
BLOCK, 0);
> >> +               ASSERT_LT(-1, self->client);
> >> +
> >> +               err =3D connect(self->client, (struct sockaddr *)&addr=
, sizeof(addr));
> >> +               ASSERT_EQ(0, err);
> >> +       }
> >> +}
> >> +
> >> +FIXTURE_TEARDOWN(unix_sock)
> >> +{
> >> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> >> +               variant->socket_type =3D=3D SOCK_SEQPACKET)
> >> +               close(self->child);
> >> +
> >> +       close(self->client);
> >> +       close(self->server);
> >> +       remove_socket_file();
> >> +}
> >> +
> >> +/* Test 1: peer closes normally */
> >> +TEST_F(unix_sock, eof)
> >> +{
> >> +       char buf[16] =3D {};
> >> +       ssize_t n;
> >> +
> >> +       /* Peer closes normally */
> >> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> >> +               variant->socket_type =3D=3D SOCK_SEQPACKET)
> >> +               close(self->child);
> >> +       else
> >> +               close(self->server);
> >> +
> >> +       n =3D recv(self->client, buf, sizeof(buf), 0);
> >> +       TH_LOG("%s: recv=3D%zd errno=3D%d (%s)", variant->name, n, err=
no, strerror(errno));
> > errno is undefined if not set, and same for strerror(errno).
> >
> > Also, if ASSERT_XXX() below fails, the same information
> > (test case, errno) is logged.  So, TH_LOG() seems unnecessary.
> >
> > Maybe try modifying the condition below and see how the
> > assertion is logged.
> Oh..thank you. Didn't it through that way.
> I understand.
> I will remove the TH_LOG()'s
> >
> >> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> >> +               variant->socket_type =3D=3D SOCK_SEQPACKET) {
> >> +               ASSERT_EQ(0, n);
> >> +       } else {
> >> +               ASSERT_EQ(-1, n);
> >> +               ASSERT_EQ(EAGAIN, errno);
> >> +       }
> >> +}
> >> +
> >> +/* Test 2: peer closes with unread data */
> >> +TEST_F(unix_sock, reset_unread)
> >> +{
> >> +       char buf[16] =3D {};
> >> +       ssize_t n;
> >> +
> >> +       /* Send data that will remain unread by client */
> >> +       send(self->client, "hello", 5, 0);
> >> +       close(self->child);
> >> +
> >> +       n =3D recv(self->client, buf, sizeof(buf), 0);
> >> +       TH_LOG("%s: recv=3D%zd errno=3D%d (%s)", variant->name, n, err=
no, strerror(errno));
> >> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> >> +               variant->socket_type =3D=3D SOCK_SEQPACKET) {
> >> +               ASSERT_EQ(-1, n);
> >> +               ASSERT_EQ(ECONNRESET, errno);
> >> +       } else {
> >> +               ASSERT_EQ(-1, n);
> >> +               ASSERT_EQ(EAGAIN, errno);
> >> +       }
> >> +}
> >> +
> >> +/* Test 3: SOCK_DGRAM peer close */
> >> Now Test 2 and Test 3 look identical ;)
>
> seems so, but the only difference is:
>
> close(self->child); is used in Test 2, while
> close(self->server); is used in Test 3.
> Maybe I should find a way to collapse Tests 2 and 3 (if statement might
> work)
>
> I am just afraid the tests to run will reduce to 6 from 9 and we will hav=
e 6
> cases passed as against 7 as before.
>
> What do you think?

The name of Test 2 is a bit confusing, which is not true
for SOCK_DGRAM.  So, I'd use "if" to change which fd
to close() depending on the socket type.

Also, close(self->server) does nothing for SOCK_STREAM
and SOCK_SEQPACKET after accept().  Rather, that close()
should have the same effect if self->child is not accept()ed.
(In this case, Skip() for SOCK_DGRAM makes sense)

I think covering that scenario would be nicer.

If interested, you can check the test coverage with this patch.
https://lore.kernel.org/linux-kselftest/20251028024339.2028774-1-kuniyu@goo=
gle.com/

Thanks!
