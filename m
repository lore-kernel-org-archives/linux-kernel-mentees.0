Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DE92EA723
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 22:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762985109; cv=none; b=Eu2/oM7O5RTaHfP9wH9rgi+x4PLduCPFkJejoIqgjyiG3x5MeyS8jBxwcp61BH9evp+SpZu98tFZCLpwrJmOVvXRpCIMp+GKdcCgCBciPQM2a5l9wnZMh+DJ3LacX4uYO2+fqSbFjdgoeBIjjvgh4DktQdfv83Z1HhQ5TfPpAUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762985109; c=relaxed/simple;
	bh=2qhpNkaMfGbH1CfnNdd4Up7M0srBKHHLqbCrBAstSk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sud9n2YXt2KA3tJUglDAq+UBFE13sw9hwuGo71qEzxC6+6XVbd7NlZjvXCDojijVeB6hop7ZDhjQReMvP8QpGZVoa9vAnYOIDPExxaJ4erfBwpXeGo6OSlUaZrqeQjt9tcDMvAd7dfC4pY/71pV7OQ+u+LyiX4rUvH+hplws0MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f+hdWq7Q; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f+hdWq7Q"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6C804009C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 22:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5GX9504RgDgp for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Nov 2025 22:05:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=kuniyu@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6CE7B40075
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CE7B40075
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=f+hdWq7Q
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6CE7B40075
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 22:05:05 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-29853ec5b8cso1216735ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 14:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762985105; x=1763589905; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKPs42nPgCf3xa7WYhvLEc5azAO7u4S86iHOJTh8d2o=;
        b=f+hdWq7Q19XnCrhjQDJu9ZqneA1FFYaTVkmt3xpTMtBJXs8z8FCoYE0U8PH/xSar3+
         PDVANx5Io1qIggO6Xp9yfM6Lt9t0FuMLlOVzYMK5o7/lpFV3HLNt5qwsK+rbReHCqUID
         hCj8kWuEKRc8E6r9fnyZzX+3HclWGlIqti3cQ2NiENERN2pcTST73qqymi5WtmQycwEg
         E408/uzS/TX8iz5T/L3uGz9GvWQQbZ9XRKmjSFMq5HqMBOfBr/DvjPI5y4ksNNprkrpr
         TgxnilZ3Oaw2ApKb7+kUUtn0Gu8sYHQRWSgeHWR76QomFIzr1ZbPtEZt77jku+xv8RQU
         UXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762985105; x=1763589905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oKPs42nPgCf3xa7WYhvLEc5azAO7u4S86iHOJTh8d2o=;
        b=Pk2EGp4ifWsI7uWXpt03dlPX5K+oWEllP6D9JBz7F3CPhgEb5tr4LwKXk/ySI9mcq0
         ayZpgK7uv5sdTOX88kiay+dRhFdFAa5MG0+NaLX+8NVnJlQrQ/WjNs+KsOWNTvYRrYvQ
         Rfw0MR4eDnHn63Y+ii9btN0kwBI8gEMuKgngTQqQn4m4xcUxLIDKWNp3fvMy4U4bjBpo
         jub0vjojMWy3hKOQ4+53Hd+FMvMZT3+IMXPKFqKjdCI34pYFhuVX5+23w6Nv2idxCpJr
         uBfvm55XGCVRyJjuHkfXSkkzygIUjslCvU+Qa3Bmkulv02YHFIhGFvnLS1RVO/0M8ivC
         42qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwtT0Xtxo6K3E3FsK7lfeYmi7PjXKyh20wjNOq1RbdhEvX8aldOiHSw1tcO0tu18v8yTaHTvQzHXSAPGjfsSB2h28a3Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwNqUlGjGVXWcLaXBZt1xVC+Q9BePpE2y6rWVdDd75eCaYHPR2e
	FN2VZMNzNJ70l6iCGat9/oo0mdDXYi67OtXRXjZYu3kgDMOeKlwaxwO7z83Wi2kvmnxmQRAYb9t
	4sS78F2z6JNaTPxdLC9eLaHZQodqXN9BLa3MqQWRi
X-Gm-Gg: ASbGncsQgdiwL0rbAe3mpdKxl6cKZR7XEVNvEax9eGpSriLJCuOZYoonM1Mv9fQg7Zn
	30n+urZOMUl3sTQ6nbAPvqlOV7Xb8mMn2cHRBpzy3i+wvq7Vmgut0ObCRdpz+NhTpvP0G/eu681
	4pHYGOcJHd0bqcT6BpCU8QDX0WyRzT7979D23wVx/s7N/bVwdwe8XVxtAkGfEL68ACMaEv5Aul7
	7EZ6NRNSt4nGkcLI2aqge0nyMofSjMCLBT6mk73i/FPUyi+hPuL6av+zIejW0ZAa5Hk64PLtCkC
	J0QlipDQ9xovUBslrEupwqJHRQ==
X-Google-Smtp-Source: AGHT+IEEm3bNv9rfezM7XwE7yjmnPOy5mZvfwXtXh1qfH7f2eoz0NkAYCYxRGrvQAR1YGl9JYIOmyR46J21A+jr8E+c=
X-Received: by 2002:a17:902:ccd1:b0:258:9d26:1860 with SMTP id
 d9443c01a7336-2984eddd8e8mr59380125ad.40.1762985104264; Wed, 12 Nov 2025
 14:05:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251112212026.31441-1-adelodunolaoluwa.ref@yahoo.com> <20251112212026.31441-1-adelodunolaoluwa@yahoo.com>
In-Reply-To: <20251112212026.31441-1-adelodunolaoluwa@yahoo.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 12 Nov 2025 14:04:52 -0800
X-Gm-Features: AWmQ_bnIPeclCbtbxPZNlzdNhqCLUG7E5kJ4h6vY_ySub0JtYOJiM91OLaOaSz0
Message-ID: <CAAVpQUB97EBnTbA9pKwdhPM0pHadiM3QhP4_1qLSKGg2LAwzkA@mail.gmail.com>
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

On Wed, Nov 12, 2025 at 1:20=E2=80=AFPM Sunday Adelodun
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
> index 000000000000..9413f8a0814f
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
> +       if (variant->socket_type =3D=3D SOCK_DGRAM) {
> +               /* No real connection, just close the server */
> +               close(self->server);
> +       } else {
> +               /* Establish full connection first */
> +               self->child =3D accept(self->server, NULL, NULL);
> +               ASSERT_LT(-1, self->child);
> +
> +               /* Send data that will remain unread */
> +               send(self->client, "hello", 5, 0);

Could you move this send() before "if (...)" because we want
to test unread_data behaviour for SOCK_DGRAM too ?

Otherwise looks good, so with that fixed:

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks!


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
