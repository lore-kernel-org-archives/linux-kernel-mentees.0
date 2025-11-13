Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A3F26FA6E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 06:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763014247; cv=none; b=Igj+Y4H25ux81KVwP24mksQP9LzD6Geym9kS6r8/sllowx4hJP5UvcCfkLRJp5I+z1zNeES/5xOYs2Uslk3rzmVoX1WTYHcl14660qiqB730pFJJZUiFtLUd/w9fZxZziedV/SkI2WytzTVoq9AlVHwlSrwg8c0ks7Y6fsdp5e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763014247; c=relaxed/simple;
	bh=JZgVvkmMqovaXMNVarstuvuRVnP6+Gz5DgI1eqaAwSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qie0QjoquUja/k6nRobs1/bYx7JY1GACP4AoE0ZzMs8ynS9sxm0DeHRcwvPYmStms7JCWvq7YB1Jey/tYwYpyUCnHm7u+Ok8TGDMdbs7RXET1cX+j+DZwVfO7a9jtX0fNg9EgCdBe09E3lSo9cyn0AaDUC9nsMl7t3sc5Qz7Auw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FnLB8H1G; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FnLB8H1G"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB65B60F10
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 06:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fipJrJo7GS9t for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Nov 2025 06:10:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=kuniyu@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 19EBD60704
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19EBD60704
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FnLB8H1G
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 19EBD60704
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 06:10:44 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2964d616df7so5384365ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 22:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763014244; x=1763619044; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gW6r0ASCKhJNFYglngEFExHVzU4sK+KFa1j2mIqWseg=;
        b=FnLB8H1G68BpC4nzmivt7N16vxpPb2zFLTT+1PYdCIE0G4FrGB8+QeDDYTOc622ba8
         cf56j4q5eKzYk8oFqcnXkYXm5rdeV6+oP1RB0xZfbEgAPm1zGET4HXkpLT/wdz1Uu77N
         ALqBqCG3FsTQd3dlZenf993gPvM9Cdop82aIEKlik5MtPZ3zwVm6+Kdom3w+qz+gFE5Z
         YiAkF8z41rK30N5GLS+pDGoKn0c6iFvgNw3fn6gEQL3XG+FrqU9SyepD17/0JMOFe4Zc
         fRpSFRcBHdvx7AQCnEtYxKSXM4g4LSrISMjeNg50XfXbtD3+FufAaqmfQsY3/YxhQ208
         kVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014244; x=1763619044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gW6r0ASCKhJNFYglngEFExHVzU4sK+KFa1j2mIqWseg=;
        b=nzLcGkAig9I+ruhgyILCOSVlsMAtsLtlshSQ/HvHCH2RlYYCaxSuYdiLhyw7rhIR75
         scf/JTS2F1zxF5WvxiQZj+fkm6AzXoXaWeuIh8W2lNUYH6Q5iEJytlTebbJObGMEyDg+
         XXJuUHJZn8CHpTc1faDoQGxU+QYyme0RZcVDg6X6+9YyRMLpdCdS8D+FWuBBKV5Sng0q
         sl/pEarE9GTpQpHXwF46D2TTPIzLIZfEbzmMH5mCQu3dwhk0X6P3YFzYswN/kPZ1hzOl
         DLkBMGaSlnLm8XSlhO0JGIBDOUu1YokbUTlYVUls1nKNfOiriUBlLZMS7wnxFHZXLCJW
         Nyhg==
X-Forwarded-Encrypted: i=1; AJvYcCXceWzd/A3tHlI9IcaGG3ibX9DiopEjZX9150eBP0BerDLDvVM49pCE/Qb1YM+aw6tHvXkpTlWATi0UE6kyO8wuSirzkw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxHSiYHUxwr9xmRIJjsKXwD1lXdsPpOKPK5ez6lSRzO9s8y+w5P
	q6TQBzsItI0u0dF32TdnWYeyOnvPLPswmBUd8FH/EcNY8PbVpQFH6pjudgHvf/Maf0dv/61m0i2
	m/XOpYJIpDaOezlcRpefVUYcjGkjfbyEyh11jUKRO
X-Gm-Gg: ASbGnctQm9jIFOrNMNo/UpsJQif4b18vOv8Mth4G0BG5DNlyuVz5gsmwVPPgIrxs1sb
	ziL108KrLh5/GOB26K3PR+oPgm8TP1woy8ik1rkjp9ttYM9KSfqcr5f8L8PZax8hUL0d+VACMpx
	Yeu043XKF6XrDu0Xmg72CdzfZvHYXaPFuHAPNpFJRYG2J68z9VeQXk3fnzVmotIHvDStsZQr2IN
	trKMnpN6UrAh5gcd14HajkJDXYFgmXVMRYtzHeeaZG4CbmkzLBp4rOuHKrgtv4wZC8OpQE9p/qz
	9HMIMO1UdWgcQDlvY6LZtavhVRvLGvN4aoSRg0NJHRNrpN/6Ng==
X-Google-Smtp-Source: AGHT+IEkpbg9A6bZTJrS46SXf+aXP4nce1dlZH6O6I47/5/6XJg9tT3U/fTcOgGzCwTT9hsNgmQrRgGWYCe/Vm0AYvo=
X-Received: by 2002:a17:902:f684:b0:26a:8171:dafa with SMTP id
 d9443c01a7336-2984ed49524mr74640225ad.21.1763014243968; Wed, 12 Nov 2025
 22:10:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251112212026.31441-1-adelodunolaoluwa.ref@yahoo.com>
 <20251112212026.31441-1-adelodunolaoluwa@yahoo.com> <CAAVpQUB97EBnTbA9pKwdhPM0pHadiM3QhP4_1qLSKGg2LAwzkA@mail.gmail.com>
 <295e5440-94eb-447f-b4f0-4943e9d02f1c@yahoo.com>
In-Reply-To: <295e5440-94eb-447f-b4f0-4943e9d02f1c@yahoo.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 12 Nov 2025 22:10:32 -0800
X-Gm-Features: AWmQ_blByZrqO_WYYCiP3ZG6rhHHMDnOi3dyaVAWeDKqTuxwCCMB3n-6ZZUHouo
Message-ID: <CAAVpQUAyPwyG=aSnv-2w7g3dqhB3BLXGoo5VmbSNqQ0txpqqWQ@mail.gmail.com>
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

On Wed, Nov 12, 2025 at 9:25=E2=80=AFPM Sunday Adelodun
<adelodunolaoluwa@yahoo.com> wrote:
>
> On 11/12/25 23:04, Kuniyuki Iwashima wrote:
> > On Wed, Nov 12, 2025 at 1:20=E2=80=AFPM Sunday Adelodun
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
> >>   tools/testing/selftests/net/.gitignore        |   1 +
> >>   tools/testing/selftests/net/af_unix/Makefile  |   1 +
> >>   .../selftests/net/af_unix/unix_connreset.c    | 178 ++++++++++++++++=
++
> >>   3 files changed, 180 insertions(+)
> >>   create mode 100644 tools/testing/selftests/net/af_unix/unix_connrese=
t.c
> >>
> >> diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/se=
lftests/net/.gitignore
> >> index 439101b518ee..e89a60581a13 100644
> >> --- a/tools/testing/selftests/net/.gitignore
> >> +++ b/tools/testing/selftests/net/.gitignore
> >> @@ -65,3 +65,4 @@ udpgso
> >>   udpgso_bench_rx
> >>   udpgso_bench_tx
> >>   unix_connect
> >> +unix_connreset
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
> >>   # end of TEST_GEN_PROGS
> >>
> >>   include ../../lib.mk
> >> diff --git a/tools/testing/selftests/net/af_unix/unix_connreset.c b/to=
ols/testing/selftests/net/af_unix/unix_connreset.c
> >> new file mode 100644
> >> index 000000000000..9413f8a0814f
> >> --- /dev/null
> >> +++ b/tools/testing/selftests/net/af_unix/unix_connreset.c
> >> @@ -0,0 +1,178 @@
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
> >> +           variant->socket_type =3D=3D SOCK_SEQPACKET) {
> >> +               err =3D listen(self->server, 1);
> >> +               ASSERT_EQ(0, err);
> >> +       }
> >> +
> >> +       self->client =3D socket(AF_UNIX, variant->socket_type | SOCK_N=
ONBLOCK, 0);
> >> +       ASSERT_LT(-1, self->client);
> >> +
> >> +       err =3D connect(self->client, (struct sockaddr *)&addr, sizeof=
(addr));
> >> +       ASSERT_EQ(0, err);
> >> +}
> >> +
> >> +FIXTURE_TEARDOWN(unix_sock)
> >> +{
> >> +       if ((variant->socket_type =3D=3D SOCK_STREAM ||
> >> +            variant->socket_type =3D=3D SOCK_SEQPACKET) & self->child=
 > 0)
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
> >> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> >> +           variant->socket_type =3D=3D SOCK_SEQPACKET) {
> >> +               self->child =3D accept(self->server, NULL, NULL);
> >> +               ASSERT_LT(-1, self->child);
> >> +
> >> +               close(self->child);
> >> +       } else {
> >> +               close(self->server);
> >> +       }
> >> +
> >> +       n =3D recv(self->client, buf, sizeof(buf), 0);
> >> +
> >> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> >> +           variant->socket_type =3D=3D SOCK_SEQPACKET) {
> >> +               ASSERT_EQ(0, n);
> >> +       } else {
> >> +               ASSERT_EQ(-1, n);
> >> +               ASSERT_EQ(EAGAIN, errno);
> >> +       }
> >> +}
> >> +
> >> +/* Test 2: peer closes with unread data */
> >> +TEST_F(unix_sock, reset_unread_behavior)
> >> +{
> >> +       char buf[16] =3D {};
> >> +       ssize_t n;
> >> +
> >> +       if (variant->socket_type =3D=3D SOCK_DGRAM) {
> >> +               /* No real connection, just close the server */
> >> +               close(self->server);
> >> +       } else {
> >> +               /* Establish full connection first */
> >> +               self->child =3D accept(self->server, NULL, NULL);
> >> +               ASSERT_LT(-1, self->child);
> >> +
> >> +               /* Send data that will remain unread */
> >> +               send(self->client, "hello", 5, 0);
> > Could you move this send() before "if (...)" because we want
> > to test unread_data behaviour for SOCK_DGRAM too ?
> >
> > Otherwise looks good, so with that fixed:
> >
> > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> >
> > Thanks!
> Thank you for the prompt response.
> I thought of putting the send before the if the statement , but I was afr=
aid
> STREAM and SEQPACKET connections won't be accepted before data sending.

connect() create the paired child socket and accept()
allocates a file descriptor to expose the socket to user
space.

In that sense, the comment above accept() sounds a
bit weird ;)


>
> I will start working on v5.
>
> That part will look like this now:
> /* Test 2: peer closes with unread data */
> TEST_F(unix_sock, reset_unread_behavior)
> {
>          char buf[16] =3D {};
>          ssize_t n;
>
> */* Send data that will remain unread */
>          send(self->client, "hello", 5, 0);*
>
> *if (variant->socket_type =3D=3D SOCK_DGRAM) {
>                  /* No real connection, just close the server */
>                  close(self->server);
>          } else {
>                  /* Establish full connection first */
>                  self->child =3D accept(self->server, NULL, NULL);
>                  ASSERT_LT(-1, self->child);
>
>                  /* Peer closes before client reads */
>                  close(self->child);
>          }*
>
>          n =3D recv(self->client, buf, sizeof(buf), 0);
>          ASSERT_EQ(-1, n);
>
>          if (variant->socket_type =3D=3D SOCK_STREAM ||
>              variant->socket_type =3D=3D SOCK_SEQPACKET) {
>                  ASSERT_EQ(ECONNRESET, errno);
>          } else {
>                  ASSERT_EQ(EAGAIN, errno);
>          }
> }
>
> Thank you once again.
> >
> >
> >> +
> >> +               /* Peer closes before client reads */
> >> +               close(self->child);
> >> +       }
> >> +
> >> +       n =3D recv(self->client, buf, sizeof(buf), 0);
> >> +       ASSERT_EQ(-1, n);
> >> +
> >> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> >> +           variant->socket_type =3D=3D SOCK_SEQPACKET) {
> >> +               ASSERT_EQ(ECONNRESET, errno);
> >> +       } else {
> >> +               ASSERT_EQ(EAGAIN, errno);
> >> +       }
> >> +}
> >> +
> >> +/* Test 3: closing unaccepted (embryo) server socket should reset cli=
ent. */
> >> +TEST_F(unix_sock, reset_closed_embryo)
> >> +{
> >> +       char buf[16] =3D {};
> >> +       ssize_t n;
> >> +
> >> +       if (variant->socket_type =3D=3D SOCK_DGRAM)
> >> +               SKIP(return, "This test only applies to SOCK_STREAM an=
d SOCK_SEQPACKET");
> >> +
> >> +       /* Close server without accept()ing */
> >> +       close(self->server);
> >> +
> >> +       n =3D recv(self->client, buf, sizeof(buf), 0);
> >> +
> >> +       ASSERT_EQ(-1, n);
> >> +       ASSERT_EQ(ECONNRESET, errno);
> >> +}
> >> +
> >> +TEST_HARNESS_MAIN
> >> +
> >> --
> >> 2.43.0
> >>
>
