Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ADD3164B1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 06:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763016789; cv=none; b=g0CAjXMzpvQvIaQd4c4MBohYyiPlUb7CsTA6aMlw622m+6G82FZHW8GhgdUHWUn9C1/hk4REsFRSZUXIY0Q9cvqjeF5E9nKiRFKH9pLpJ+2/wNL5J1+NsKi1xhMswhB+KRDWuUp64ZIWMVrIBMA2iVo/VxzD/XalvO6Rw1aazjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763016789; c=relaxed/simple;
	bh=zOMRoPVPYQ8ukpjMdMdPE8GhIrZY/aAog6X34k9oJLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g37l5Dub34ssQ0pWeBjCZxhT/Q2Wh6uCA4TbS9CLPZ0DlUyhwA6nOCMCnbB5bhvAlz/dHGg2LlNiKtfKOGNnF7LQtgvueNo8PD0XoV4nQrLQJnixoorz3DBhSEoYMkhkiEhHeErLGs9F7bVeIG7h8QuWOjadUFKe70hzoW/O0Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vX1OJ2ff; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vX1OJ2ff"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FA0840C11
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 06:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZpW3oLV_Y3gs for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Nov 2025 06:53:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=kuniyu@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DE6540C10
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DE6540C10
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vX1OJ2ff
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9DE6540C10
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 06:53:06 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-29568d93e87so3953195ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 22:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763016786; x=1763621586; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVMm38c7OdWDaS6KWkvVH6FzHgi2ZfdMvON3kTvQfvs=;
        b=vX1OJ2ffP+jysJDxE9tSSG2Zy4oa16XZYNFp7IcxMNFLo68d6IgaYtBRulGXl03m0c
         3By0MAAEz8mKhKNVbco8D/R7SK1vUCbCTyM853Ot/8TDUyC8N8k1alrkWdhhykTvWCV/
         mNZNw1RkM36a28Fwckpg1i7kcdDZA/1EoQiP8tIfqHl7ejZl5+f0bU6EEB4pZE6Rvyqh
         2bfXT9dinKKmF/PDiVytwhhKek3C5MYAULazVBud0OPmmeTAqY1QB7ZxTo1RDPc1adrC
         NhhjQPrUfiKovGq/gVAsH6dgX43gopImpCPjZnSw1DosAAArI0E8grYt7QtD9cP4j/Ln
         r0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763016786; x=1763621586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hVMm38c7OdWDaS6KWkvVH6FzHgi2ZfdMvON3kTvQfvs=;
        b=iAcsXMLY1i7Rd22pD+cKTLpHiigg5BjK68ZTGmto/fFyEH24tdxJir4CoV/4NLl2Rm
         bPIJtpVgbb4widq6v3SLKIJKMo1/1ilYzfK4I0GgvYNuLdArRa2jLFz6HSSiizkQ5R6l
         QSuAku+QbjKYvbCu7y9fWTkQHWzVb1Y5gVH09cJ9a0iepmbXZzc6CA9bcGiIg2CY7puv
         TK1JmmVq6Ztcr/SRnBW5znU+jlf+X5/HmV4NqPtTdm0j+pPpw7hSwFgXPYd1BCpcOsGf
         8Tw24pBu6yGAmdM1SB4jLR+iyte5QQ9JLPeEeGmbOowOwfY8bGjIMeQs1M5a8HAiejtL
         oH2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2F5C2DuGX+/3KXXqazAue9Qg2ffukNL6mLd5yduboE3n96cvFsw+NhC5Bc1+G7VXSfh4YCu5WS9uYPMQ2H6H044bCiQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwBvI/uOBPAJx+fzMYgdcvMrHDneyP8qNw/NL8nFtL9RQ6UTZgJ
	xZKfGZ2QAkU/5uLuueNL1x2JRoBD/X9k203LxbmngY1npPUlgEpW0ieO8cCOu9gpbHzuqieyVXD
	SuxyQuKX9jyVG+H1700NQ/vzmzosslvQJOkw53IGX
X-Gm-Gg: ASbGncs6YsT1Au2vRpz8g4Mg46D0FYrD9Z9yDG4d06RDIgN4Cy96QGwKTONgTOZHLQZ
	GrXdmY9GXMWtB4keAjmnQwMqdrQf/8MSnqWqYaHFCvdmoNCylGm5RSgaDzdk6GGXWKak/OCmpDX
	v62ET/C3iBOId5oJFEnQ8kjoDn3zU+OmTELt44iiM6ab4hQF+0Eo4vF6Ct6caJCsLjCSKGHoOWz
	VdI4z5Xc6lsa7zlzI5y5t2VZOIN5uSYrv7b/giZ8Bv1POABy6AqpA5m22L7FipaXxjF/yzeavA4
	FiJWMHIrOFbdYK39KsnvP0GP3uh+mOxwCJf/mes=
X-Google-Smtp-Source: AGHT+IG2wsNx9NQBfbLeNX7Jh3Qb75bsTSse02cznwHpckC+B6lEAV9oDqzgW+aV2nULcMuZlpOij+cmVn9FUKnq8hY=
X-Received: by 2002:a17:903:b0b:b0:295:8dbb:b3cd with SMTP id
 d9443c01a7336-2984eda4092mr70785975ad.27.1763016785549; Wed, 12 Nov 2025
 22:53:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251112212026.31441-1-adelodunolaoluwa.ref@yahoo.com>
 <20251112212026.31441-1-adelodunolaoluwa@yahoo.com> <CAAVpQUB97EBnTbA9pKwdhPM0pHadiM3QhP4_1qLSKGg2LAwzkA@mail.gmail.com>
 <295e5440-94eb-447f-b4f0-4943e9d02f1c@yahoo.com> <CAAVpQUAyPwyG=aSnv-2w7g3dqhB3BLXGoo5VmbSNqQ0txpqqWQ@mail.gmail.com>
 <335f64d5-390b-4529-b2da-0af019c7f598@yahoo.com>
In-Reply-To: <335f64d5-390b-4529-b2da-0af019c7f598@yahoo.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 12 Nov 2025 22:52:54 -0800
X-Gm-Features: AWmQ_blCkB7sQXMekaUeLv3LH0J3atTUg-0_lPLxJ7EujaG3EvIDORDMP7QTj8Q
Message-ID: <CAAVpQUDX2LcWu+u5CHSJUoPnHLuGNoPzEZuV+K67WoPUUvymdg@mail.gmail.com>
Subject: Re: [PATCH v4] selftests: af_unix: Add tests for ECONNRESET and EOF semantics
To: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 10:41=E2=80=AFPM Sunday Adelodun
<adelodunolaoluwa@yahoo.com> wrote:
>
> On 11/13/25 07:10, Kuniyuki Iwashima wrote:
> > On Wed, Nov 12, 2025 at 9:25=E2=80=AFPM Sunday Adelodun
> > <adelodunolaoluwa@yahoo.com> wrote:
> >> On 11/12/25 23:04, Kuniyuki Iwashima wrote:
> >>> On Wed, Nov 12, 2025 at 1:20=E2=80=AFPM Sunday Adelodun
> >>> <adelodunolaoluwa@yahoo.com> wrote:
> >>>> Add selftests to verify and document Linux=E2=80=99s intended behavi=
our for
> >>>> UNIX domain sockets (SOCK_STREAM and SOCK_DGRAM) when a peer closes.
> >>>> The tests verify that:
> >>>>
> >>>>    1. SOCK_STREAM returns EOF when the peer closes normally.
> >>>>    2. SOCK_STREAM returns ECONNRESET if the peer closes with unread =
data.
> >>>>    3. SOCK_SEQPACKET returns EOF when the peer closes normally.
> >>>>    4. SOCK_SEQPACKET returns ECONNRESET if the peer closes with unre=
ad data.
> >>>>    5. SOCK_DGRAM does not return ECONNRESET when the peer closes.
> >>>>
> >>>> This follows up on review feedback suggesting a selftest to clarify
> >>>> Linux=E2=80=99s semantics.
> >>>>
> >>>> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> >>>> Signed-off-by: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
> >>>> ---
> >>>>    tools/testing/selftests/net/.gitignore        |   1 +
> >>>>    tools/testing/selftests/net/af_unix/Makefile  |   1 +
> >>>>    .../selftests/net/af_unix/unix_connreset.c    | 178 +++++++++++++=
+++++
> >>>>    3 files changed, 180 insertions(+)
> >>>>    create mode 100644 tools/testing/selftests/net/af_unix/unix_connr=
eset.c
> >>>>
> >>>> diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/=
selftests/net/.gitignore
> >>>> index 439101b518ee..e89a60581a13 100644
> >>>> --- a/tools/testing/selftests/net/.gitignore
> >>>> +++ b/tools/testing/selftests/net/.gitignore
> >>>> @@ -65,3 +65,4 @@ udpgso
> >>>>    udpgso_bench_rx
> >>>>    udpgso_bench_tx
> >>>>    unix_connect
> >>>> +unix_connreset
> >>>> diff --git a/tools/testing/selftests/net/af_unix/Makefile b/tools/te=
sting/selftests/net/af_unix/Makefile
> >>>> index de805cbbdf69..5826a8372451 100644
> >>>> --- a/tools/testing/selftests/net/af_unix/Makefile
> >>>> +++ b/tools/testing/selftests/net/af_unix/Makefile
> >>>> @@ -7,6 +7,7 @@ TEST_GEN_PROGS :=3D \
> >>>>           scm_pidfd \
> >>>>           scm_rights \
> >>>>           unix_connect \
> >>>> +       unix_connreset \
> >>>>    # end of TEST_GEN_PROGS
> >>>>
> >>>>    include ../../lib.mk
> >>>> diff --git a/tools/testing/selftests/net/af_unix/unix_connreset.c b/=
tools/testing/selftests/net/af_unix/unix_connreset.c
> >>>> new file mode 100644
> >>>> index 000000000000..9413f8a0814f
> >>>> --- /dev/null
> >>>> +++ b/tools/testing/selftests/net/af_unix/unix_connreset.c
> >>>> @@ -0,0 +1,178 @@
> >>>> +// SPDX-License-Identifier: GPL-2.0
> >>>> +/*
> >>>> + * Selftest for AF_UNIX socket close and ECONNRESET behaviour.
> >>>> + *
> >>>> + * This test verifies:
> >>>> + *  1. SOCK_STREAM returns EOF when the peer closes normally.
> >>>> + *  2. SOCK_STREAM returns ECONNRESET if peer closes with unread da=
ta.
> >>>> + *  3. SOCK_SEQPACKET returns EOF when the peer closes normally.
> >>>> + *  4. SOCK_SEQPACKET returns ECONNRESET if the peer closes with un=
read data.
> >>>> + *  5. SOCK_DGRAM does not return ECONNRESET when the peer closes.
> >>>> + *
> >>>> + * These tests document the intended Linux behaviour.
> >>>> + *
> >>>> + */
> >>>> +
> >>>> +#define _GNU_SOURCE
> >>>> +#include <stdlib.h>
> >>>> +#include <string.h>
> >>>> +#include <fcntl.h>
> >>>> +#include <unistd.h>
> >>>> +#include <errno.h>
> >>>> +#include <sys/socket.h>
> >>>> +#include <sys/un.h>
> >>>> +#include "../../kselftest_harness.h"
> >>>> +
> >>>> +#define SOCK_PATH "/tmp/af_unix_connreset.sock"
> >>>> +
> >>>> +static void remove_socket_file(void)
> >>>> +{
> >>>> +       unlink(SOCK_PATH);
> >>>> +}
> >>>> +
> >>>> +FIXTURE(unix_sock)
> >>>> +{
> >>>> +       int server;
> >>>> +       int client;
> >>>> +       int child;
> >>>> +};
> >>>> +
> >>>> +FIXTURE_VARIANT(unix_sock)
> >>>> +{
> >>>> +       int socket_type;
> >>>> +       const char *name;
> >>>> +};
> >>>> +
> >>>> +FIXTURE_VARIANT_ADD(unix_sock, stream) {
> >>>> +       .socket_type =3D SOCK_STREAM,
> >>>> +       .name =3D "SOCK_STREAM",
> >>>> +};
> >>>> +
> >>>> +FIXTURE_VARIANT_ADD(unix_sock, dgram) {
> >>>> +       .socket_type =3D SOCK_DGRAM,
> >>>> +       .name =3D "SOCK_DGRAM",
> >>>> +};
> >>>> +
> >>>> +FIXTURE_VARIANT_ADD(unix_sock, seqpacket) {
> >>>> +       .socket_type =3D SOCK_SEQPACKET,
> >>>> +       .name =3D "SOCK_SEQPACKET",
> >>>> +};
> >>>> +
> >>>> +FIXTURE_SETUP(unix_sock)
> >>>> +{
> >>>> +       struct sockaddr_un addr =3D {};
> >>>> +       int err;
> >>>> +
> >>>> +       addr.sun_family =3D AF_UNIX;
> >>>> +       strcpy(addr.sun_path, SOCK_PATH);
> >>>> +       remove_socket_file();
> >>>> +
> >>>> +       self->server =3D socket(AF_UNIX, variant->socket_type, 0);
> >>>> +       ASSERT_LT(-1, self->server);
> >>>> +
> >>>> +       err =3D bind(self->server, (struct sockaddr *)&addr, sizeof(=
addr));
> >>>> +       ASSERT_EQ(0, err);
> >>>> +
> >>>> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> >>>> +           variant->socket_type =3D=3D SOCK_SEQPACKET) {
> >>>> +               err =3D listen(self->server, 1);
> >>>> +               ASSERT_EQ(0, err);
> >>>> +       }
> >>>> +
> >>>> +       self->client =3D socket(AF_UNIX, variant->socket_type | SOCK=
_NONBLOCK, 0);
> >>>> +       ASSERT_LT(-1, self->client);
> >>>> +
> >>>> +       err =3D connect(self->client, (struct sockaddr *)&addr, size=
of(addr));
> >>>> +       ASSERT_EQ(0, err);
> >>>> +}
> >>>> +
> >>>> +FIXTURE_TEARDOWN(unix_sock)
> >>>> +{
> >>>> +       if ((variant->socket_type =3D=3D SOCK_STREAM ||
> >>>> +            variant->socket_type =3D=3D SOCK_SEQPACKET) & self->chi=
ld > 0)
> >>>> +               close(self->child);
> >>>> +
> >>>> +       close(self->client);
> >>>> +       close(self->server);
> >>>> +       remove_socket_file();
> >>>> +}
> >>>> +
> >>>> +/* Test 1: peer closes normally */
> >>>> +TEST_F(unix_sock, eof)
> >>>> +{
> >>>> +       char buf[16] =3D {};
> >>>> +       ssize_t n;
> >>>> +
> >>>> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> >>>> +           variant->socket_type =3D=3D SOCK_SEQPACKET) {
> >>>> +               self->child =3D accept(self->server, NULL, NULL);
> >>>> +               ASSERT_LT(-1, self->child);
> >>>> +
> >>>> +               close(self->child);
> >>>> +       } else {
> >>>> +               close(self->server);
> >>>> +       }
> >>>> +
> >>>> +       n =3D recv(self->client, buf, sizeof(buf), 0);
> >>>> +
> >>>> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> >>>> +           variant->socket_type =3D=3D SOCK_SEQPACKET) {
> >>>> +               ASSERT_EQ(0, n);
> >>>> +       } else {
> >>>> +               ASSERT_EQ(-1, n);
> >>>> +               ASSERT_EQ(EAGAIN, errno);
> >>>> +       }
> >>>> +}
> >>>> +
> >>>> +/* Test 2: peer closes with unread data */
> >>>> +TEST_F(unix_sock, reset_unread_behavior)
> >>>> +{
> >>>> +       char buf[16] =3D {};
> >>>> +       ssize_t n;
> >>>> +
> >>>> +       if (variant->socket_type =3D=3D SOCK_DGRAM) {
> >>>> +               /* No real connection, just close the server */
> >>>> +               close(self->server);
> >>>> +       } else {
> >>>> +               /* Establish full connection first */
> >>>> +               self->child =3D accept(self->server, NULL, NULL);
> >>>> +               ASSERT_LT(-1, self->child);
> >>>> +
> >>>> +               /* Send data that will remain unread */
> >>>> +               send(self->client, "hello", 5, 0);
> >>> Could you move this send() before "if (...)" because we want
> >>> to test unread_data behaviour for SOCK_DGRAM too ?
> >>>
> >>> Otherwise looks good, so with that fixed:
> >>>
> >>> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> >>>
> >>> Thanks!
> >> Thank you for the prompt response.
> >> I thought of putting the send before the if the statement , but I was =
afraid
> >> STREAM and SEQPACKET connections won't be accepted before data sending=
.
> > connect() create the paired child socket and accept()
> > allocates a file descriptor to expose the socket to user
> > space.
> Thank you for this explanation.
> >
> > In that sense, the comment above accept() sounds a
> > bit weird ;)
> I understand.
> I am changing it to
> /* Accept client connection */

I'd remove it since it just repeats the code, but up to you.

Thanks!

>
> If this is accepted, I will send v5 immediately
>
> Thank you for your guidance.
> >
> >
> >> I will start working on v5.
> >>
> >> That part will look like this now:
> >> /* Test 2: peer closes with unread data */
> >> TEST_F(unix_sock, reset_unread_behavior)
> >> {
> >>           char buf[16] =3D {};
> >>           ssize_t n;
> >>
> >> */* Send data that will remain unread */
> >>           send(self->client, "hello", 5, 0);*
> >>
> >> *if (variant->socket_type =3D=3D SOCK_DGRAM) {
> >>                   /* No real connection, just close the server */
> >>                   close(self->server);
> >>           } else {
> >>                   /* Establish full connection first */
> >>                   self->child =3D accept(self->server, NULL, NULL);
> >>                   ASSERT_LT(-1, self->child);
> >>
> >>                   /* Peer closes before client reads */
> >>                   close(self->child);
> >>           }*
> >>
> >>           n =3D recv(self->client, buf, sizeof(buf), 0);
> >>           ASSERT_EQ(-1, n);
> >>
> >>           if (variant->socket_type =3D=3D SOCK_STREAM ||
> >>               variant->socket_type =3D=3D SOCK_SEQPACKET) {
> >>                   ASSERT_EQ(ECONNRESET, errno);
> >>           } else {
> >>                   ASSERT_EQ(EAGAIN, errno);
> >>           }
> >> }
> >>
> >> Thank you once again.
> >>>
> >>>> +
> >>>> +               /* Peer closes before client reads */
> >>>> +               close(self->child);
> >>>> +       }
> >>>> +
> >>>> +       n =3D recv(self->client, buf, sizeof(buf), 0);
> >>>> +       ASSERT_EQ(-1, n);
> >>>> +
> >>>> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> >>>> +           variant->socket_type =3D=3D SOCK_SEQPACKET) {
> >>>> +               ASSERT_EQ(ECONNRESET, errno);
> >>>> +       } else {
> >>>> +               ASSERT_EQ(EAGAIN, errno);
> >>>> +       }
> >>>> +}
> >>>> +
> >>>> +/* Test 3: closing unaccepted (embryo) server socket should reset c=
lient. */
> >>>> +TEST_F(unix_sock, reset_closed_embryo)
> >>>> +{
> >>>> +       char buf[16] =3D {};
> >>>> +       ssize_t n;
> >>>> +
> >>>> +       if (variant->socket_type =3D=3D SOCK_DGRAM)
> >>>> +               SKIP(return, "This test only applies to SOCK_STREAM =
and SOCK_SEQPACKET");
> >>>> +
> >>>> +       /* Close server without accept()ing */
> >>>> +       close(self->server);
> >>>> +
> >>>> +       n =3D recv(self->client, buf, sizeof(buf), 0);
> >>>> +
> >>>> +       ASSERT_EQ(-1, n);
> >>>> +       ASSERT_EQ(ECONNRESET, errno);
> >>>> +}
> >>>> +
> >>>> +TEST_HARNESS_MAIN
> >>>> +
> >>>> --
> >>>> 2.43.0
> >>>>
>
