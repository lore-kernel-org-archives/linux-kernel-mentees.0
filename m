Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34771331A57
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 08:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763023430; cv=none; b=pmjL+el2X3ZCVBjcM8yoA8aO5JLlJHnuDC4u4sk7Brtw2OrLWmo4f3mjtkX7vo3OPkMjiQHcq9RMnlycrOjf7nxjOOXjFMT/GsaqxGh4s40rbclbfCW2AjQCy03dH9QSKIgKgAPvgQ22azSL1vZRgWgy4SdZWva9TdmKywt9w6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763023430; c=relaxed/simple;
	bh=jse6Fvf91Bj1D9bHF1Cetv+Q41yOk1kjQNQ2qIrFsdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M/A1utHBs5dusaAncZSBtgCpb9AHU0wpDvSRaOTsyPPBjTm7MJK7B3RxTflA+fguw6lnpPHQNOlIHK70Iev55bxoaRljmJ/zwk4i0d9u28GuCBYMIk5yRRDZs6C//Xrqdb26MJPviUxUxoARbUvZAm2nW6HjBC1btI4n12Lxp5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mjS9QqiA; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mjS9QqiA"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C778481E55
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 08:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OnTB_3y8O9iF for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Nov 2025 08:43:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=kuniyu@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D4CA81E54
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D4CA81E54
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=mjS9QqiA
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9D4CA81E54
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 08:43:47 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-29555b384acso5846495ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 00:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763023427; x=1763628227; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j82bvNFvImNkIdmXcdyCuYEbPQ6AAn6vtq3RYsevuB0=;
        b=mjS9QqiAAo+l4LlcU67f7Wv7V0MZ87wrbM93xyZJT4ThV4tEY4stwLQR/WM43mM5ZR
         Y2s5qJN4sqVWoSyMO/Y02WwU2z8hSBhIfRWz3bUCNmGpBFeNP3yhV8ZInGxiYGKvwi9m
         oRxX8X+C8vF1wuC5rvlryEV5ZBNTRIdQvizCOeMDbN7V6wsMgHYdxgxuHKy9MBEboJFh
         DGpqe63xvli2po5dKAbrDw/zgSj8GqWRQ07NYdzUr+8QZl1xvGrs5EUmifAGCqiXGucy
         c2T5uWblP6H3KoZRm5R9PrhTGUCNCGXlYRXjNXCp/KZf/LjHpkfsbct8un/Jg6oGRev/
         9IOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763023427; x=1763628227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j82bvNFvImNkIdmXcdyCuYEbPQ6AAn6vtq3RYsevuB0=;
        b=frZ9MwULWmJedGHoguo6t47dXgKiCTCobRLxbqwqQvvwaxhO8G4BPNLGOWwno2pBpK
         1kwj0FbeulRD1LNF7MACG4xkn2t5PHJ+AsC6zH4wnWuPp2S54SMR5uxWb0+U09WPE1vu
         XRvc5nLWXjREmHiuYQKzgasyHVovJ2MxEAEkph55eN+Udp/36koCbe7oHeA9V9kteQTW
         PIr+EhNTXReORIG0Sdz8rgSGtw7PqEMy4pLFWsz46ck2uv9mSCdlptKGlFr1fpnJZmaF
         Frf6yFsZbwNE+F803LKD3j43GyV0YHSh03GFm8hs1UUomrWNKlklxq3h1giUcbwR5Bmm
         s98w==
X-Forwarded-Encrypted: i=1; AJvYcCXiCVQ0hQ4rRyrPQgxePZ6FeVJzqLGTzp+jcB40hJwSk6U6+rtWtCEl8E3oUJi2VUvTYDYx5qkrF3lYzURvC/5qBpn9iA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyYBVsbC++g/EQ4UQk2YDyxhvVVMikVqvGwwUMixPG1f+S5o+cV
	jzN87nGCUNyKaCazUpQoxyVpWiYPFhOuvenQH8iJK7fsUHGtr+J2bm4Sypod0raDebACRdQVQuV
	WOQq/J5DW8eVUkApYD8q0zyBTHes9n43bPIjkt7Qg
X-Gm-Gg: ASbGncv5kQp/mvHUIiiMshAtRcLhwJvE+owx+rl00HaehKBYzwZzR3JyHqilb8XojO9
	u7FBuAJnJXSU2k5jLssTum8/+d0JwgcCq//vfkC9C+sH0806acLG+s+EpjDIx9b4Vky0UejAeD9
	okc1DbtrNMCvvXFNQfXBeXUvFwLoEBUqruT8hMhR3/mbv3kiBn3ngH5EfNMxhJnw0eQAjmk3sgV
	IwnvPoiF049ce3HuAB3jNxhzhmEDuuBiBaMghrWvxn969Hn6Jx42SdADlZ2wuEl1Ii6drFlinLq
	9284EhnmrLcWbqGIFWXY6ym9hLoA3niIFv4XEpo=
X-Google-Smtp-Source: AGHT+IFRjxtEMxqTf2ZiPcWD+w/6WxiFP8vWz2ry+bgq6jmCqzkoz3cIoI/9FBit5SMj949e5QZd1XphprmQPlN7Kao=
X-Received: by 2002:a17:903:2c04:b0:295:68dd:4ebf with SMTP id
 d9443c01a7336-2984ed347bemr84532525ad.16.1763023426416; Thu, 13 Nov 2025
 00:43:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251113071756.40118-1-adelodunolaoluwa.ref@yahoo.com> <20251113071756.40118-1-adelodunolaoluwa@yahoo.com>
In-Reply-To: <20251113071756.40118-1-adelodunolaoluwa@yahoo.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 13 Nov 2025 00:43:34 -0800
X-Gm-Features: AWmQ_bledBDMon-7jfxD9YyY1CjbXYKMvQ22CAf96HxnEGlMpnIBxJ-QLZCGer0
Message-ID: <CAAVpQUBvLN=sRVb8cbMngwm3o=KZkVOeCYdyi2p5sYjjZQU=HQ@mail.gmail.com>
Subject: Re: [PATCH v5] selftests: af_unix: Add tests for ECONNRESET and EOF semantics
To: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 11:19=E2=80=AFPM Sunday Adelodun
<adelodunolaoluwa@yahoo.com> wrote:
>
> Add selftests to verify and document Linux=E2=80=99s intended behaviour f=
or
> UNIX domain sockets (SOCK_STREAM and SOCK_DGRAM) when a peer closes.
> The tests verify that:
>
>  1. SOCK_STREAM returns EOF when the peer closes normally.
>  2. SOCK_STREAM returns ECONNRESET if the peer closes with unread data.
>  3. SOCK_SEQPACKET returns EOF when the peer closes normally.
>  4. SOCK_SEQPACKET returns ECONNRESET if the peer closes with unread data=
.
>  5. SOCK_DGRAM does not return ECONNRESET when the peer closes.
>
> This follows up on review feedback suggesting a selftest to clarify
> Linux=E2=80=99s semantics.
>
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
> ---
> Changelog:
>
> changes made in v4 to v5:
> 1. Moved the send() call before the socket type check in Test 2 to ensure
>    the unread data behavior is tested for SOCK_DGRAM as well.
>
> 2. Removed the misleading commend about accept() for clarity.
>
> 3. Applied indentation fixes for style consistency
>    (alignment with open parenthesis).
>
> 4. Minor comment and formatting cleanups for clarity and adherence
>    to kernel coding style.
>
>  tools/testing/selftests/net/.gitignore        |   1 +
>  tools/testing/selftests/net/af_unix/Makefile  |   1 +
>  .../selftests/net/af_unix/unix_connreset.c    | 178 ++++++++++++++++++
>  3 files changed, 180 insertions(+)
>  create mode 100644 tools/testing/selftests/net/af_unix/unix_connreset.c
>
> diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selft=
ests/net/.gitignore
> index 439101b518ee..e89a60581a13 100644
> --- a/tools/testing/selftests/net/.gitignore
> +++ b/tools/testing/selftests/net/.gitignore
> @@ -65,3 +65,4 @@ udpgso
>  udpgso_bench_rx
>  udpgso_bench_tx
>  unix_connect
> +unix_connreset
> diff --git a/tools/testing/selftests/net/af_unix/Makefile b/tools/testing=
/selftests/net/af_unix/Makefile
> index de805cbbdf69..5826a8372451 100644
> --- a/tools/testing/selftests/net/af_unix/Makefile
> +++ b/tools/testing/selftests/net/af_unix/Makefile
> @@ -7,6 +7,7 @@ TEST_GEN_PROGS :=3D \
>         scm_pidfd \
>         scm_rights \
>         unix_connect \
> +       unix_connreset \
>  # end of TEST_GEN_PROGS
>
>  include ../../lib.mk
> diff --git a/tools/testing/selftests/net/af_unix/unix_connreset.c b/tools=
/testing/selftests/net/af_unix/unix_connreset.c
> new file mode 100644
> index 000000000000..9cb0f48597eb
> --- /dev/null
> +++ b/tools/testing/selftests/net/af_unix/unix_connreset.c
> @@ -0,0 +1,178 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Selftest for AF_UNIX socket close and ECONNRESET behaviour.
> + *
> + * This test verifies:
> + *  1. SOCK_STREAM returns EOF when the peer closes normally.
> + *  2. SOCK_STREAM returns ECONNRESET if peer closes with unread data.
> + *  3. SOCK_SEQPACKET returns EOF when the peer closes normally.
> + *  4. SOCK_SEQPACKET returns ECONNRESET if the peer closes with unread =
data.
> + *  5. SOCK_DGRAM does not return ECONNRESET when the peer closes.
> + *
> + * These tests document the intended Linux behaviour.
> + *
> + */
> +
> +#define _GNU_SOURCE
> +#include <stdlib.h>
> +#include <string.h>
> +#include <fcntl.h>
> +#include <unistd.h>
> +#include <errno.h>
> +#include <sys/socket.h>
> +#include <sys/un.h>
> +#include "../../kselftest_harness.h"
> +
> +#define SOCK_PATH "/tmp/af_unix_connreset.sock"
> +
> +static void remove_socket_file(void)
> +{
> +       unlink(SOCK_PATH);
> +}
> +
> +FIXTURE(unix_sock)
> +{
> +       int server;
> +       int client;
> +       int child;
> +};
> +
> +FIXTURE_VARIANT(unix_sock)
> +{
> +       int socket_type;
> +       const char *name;
> +};
> +
> +FIXTURE_VARIANT_ADD(unix_sock, stream) {
> +       .socket_type =3D SOCK_STREAM,
> +       .name =3D "SOCK_STREAM",
> +};
> +
> +FIXTURE_VARIANT_ADD(unix_sock, dgram) {
> +       .socket_type =3D SOCK_DGRAM,
> +       .name =3D "SOCK_DGRAM",
> +};
> +
> +FIXTURE_VARIANT_ADD(unix_sock, seqpacket) {
> +       .socket_type =3D SOCK_SEQPACKET,
> +       .name =3D "SOCK_SEQPACKET",
> +};
> +
> +FIXTURE_SETUP(unix_sock)
> +{
> +       struct sockaddr_un addr =3D {};
> +       int err;
> +
> +       addr.sun_family =3D AF_UNIX;
> +       strcpy(addr.sun_path, SOCK_PATH);
> +       remove_socket_file();
> +
> +       self->server =3D socket(AF_UNIX, variant->socket_type, 0);
> +       ASSERT_LT(-1, self->server);
> +
> +       err =3D bind(self->server, (struct sockaddr *)&addr, sizeof(addr)=
);
> +       ASSERT_EQ(0, err);
> +
> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> +           variant->socket_type =3D=3D SOCK_SEQPACKET) {
> +               err =3D listen(self->server, 1);
> +               ASSERT_EQ(0, err);
> +       }
> +
> +       self->client =3D socket(AF_UNIX, variant->socket_type | SOCK_NONB=
LOCK, 0);
> +       ASSERT_LT(-1, self->client);
> +
> +       err =3D connect(self->client, (struct sockaddr *)&addr, sizeof(ad=
dr));
> +       ASSERT_EQ(0, err);
> +}
> +
> +FIXTURE_TEARDOWN(unix_sock)
> +{
> +       if ((variant->socket_type =3D=3D SOCK_STREAM ||
> +            variant->socket_type =3D=3D SOCK_SEQPACKET) & self->child > =
0)

Sorry for missing this one, but NIPA caught this.
see: https://netdev.bots.linux.dev/static/nipa/1022816/14311938/build_tools=
/stderr

+unix_connreset.c: In function =E2=80=98unix_sock_teardown=E2=80=99:
+unix_connreset.c:92:68: warning: suggest parentheses around
comparison in operand of =E2=80=98&=E2=80=99 [-Wparentheses]
+   92 |              variant->socket_type =3D=3D SOCK_SEQPACKET) & self->c=
hild > 0)
+      |                                                        ~~~~~~~~~~~=
~^~~

I think you can simply remove the "& self->child >0" part
because you don't check that for self->server below anyway.

Thanks


> +               close(self->child);
> +
> +       close(self->client);
> +       close(self->server);
> +       remove_socket_file();
> +}
> +
> +/* Test 1: peer closes normally */
> +TEST_F(unix_sock, eof)
> +{
> +       char buf[16] =3D {};
> +       ssize_t n;
> +
> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> +           variant->socket_type =3D=3D SOCK_SEQPACKET) {
> +               self->child =3D accept(self->server, NULL, NULL);
> +               ASSERT_LT(-1, self->child);
> +
> +               close(self->child);
> +       } else {
> +               close(self->server);
> +       }
> +
> +       n =3D recv(self->client, buf, sizeof(buf), 0);
> +
> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> +           variant->socket_type =3D=3D SOCK_SEQPACKET) {
> +               ASSERT_EQ(0, n);
> +       } else {
> +               ASSERT_EQ(-1, n);
> +               ASSERT_EQ(EAGAIN, errno);
> +       }
> +}
> +
> +/* Test 2: peer closes with unread data */
> +TEST_F(unix_sock, reset_unread_behavior)
> +{
> +       char buf[16] =3D {};
> +       ssize_t n;
> +
> +       /* Send data that will remain unread */
> +       send(self->client, "hello", 5, 0);
> +
> +       if (variant->socket_type =3D=3D SOCK_DGRAM) {
> +               /* No real connection, just close the server */
> +               close(self->server);
> +       } else {
> +               /* Accept client connection */
> +               self->child =3D accept(self->server, NULL, NULL);
> +               ASSERT_LT(-1, self->child);
> +
> +               /* Peer closes before client reads */
> +               close(self->child);
> +       }
> +
> +       n =3D recv(self->client, buf, sizeof(buf), 0);
> +       ASSERT_EQ(-1, n);
> +
> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> +           variant->socket_type =3D=3D SOCK_SEQPACKET) {
> +               ASSERT_EQ(ECONNRESET, errno);
> +       } else {
> +               ASSERT_EQ(EAGAIN, errno);
> +       }
> +}
> +
> +/* Test 3: closing unaccepted (embryo) server socket should reset client=
. */
> +TEST_F(unix_sock, reset_closed_embryo)
> +{
> +       char buf[16] =3D {};
> +       ssize_t n;
> +
> +       if (variant->socket_type =3D=3D SOCK_DGRAM)
> +               SKIP(return, "This test only applies to SOCK_STREAM and S=
OCK_SEQPACKET");
> +
> +       /* Close server without accept()ing */
> +       close(self->server);
> +
> +       n =3D recv(self->client, buf, sizeof(buf), 0);
> +
> +       ASSERT_EQ(-1, n);
> +       ASSERT_EQ(ECONNRESET, errno);
> +}
> +
> +TEST_HARNESS_MAIN
> +
> --
> 2.43.0
>
