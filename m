Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9757F1DDC1B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 18:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761676110; cv=none; b=bHjVHkvoLzR1PDW+C30UZT7QyMYzvXRzc+twhHg3LPBEmlHXIXvdgYNJGtUw31Ac/tn/JV4sVznzjZxfn48fQXzRyssAfLeF+3C83HTge6EotW5FZzjzZ/myvnRbAK2MQ0t2ms9jK/Qto3eOOcFmJzi5nWkxL3xCrObm4Tt9+RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761676110; c=relaxed/simple;
	bh=2a2XJVs9ZstRVlMwHGaX/LzLjoMWBC1o41QfM3zzQls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QqjxHExWxmtvD5GAUQPmx32ffcEj5exyV8P6mt6tMV6KmchabhZ5CNeUc0aiuYJ4LJZUo/O9HflnoLehB9an02Q6pbR1al/p1qatKGWhYiHEvbRG32NaVG6DmnM+2JURD+6zmDcvzFWqh9otfaX4UBamtEmzEJyt3N65zZBRLGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cKbY7VQO; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cKbY7VQO"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 156F640416
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 18:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmOTfrzJtG1D for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Oct 2025 18:28:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=kuniyu@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4FF0E400AC
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FF0E400AC
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cKbY7VQO
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4FF0E400AC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 18:28:27 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b6cf25c9ad5so4950428a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 11:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761676106; x=1762280906; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwwqbizLme2jEhCIP8tyn9yg6ZUbIw3HVu7qFcIaTlE=;
        b=cKbY7VQOB2euuSq23Ufa6F3K+USZMZIoRmV/9D7hDWvtUaL6G9YBL0mCqIWHChZp/r
         iTeOAoboMwYE1ddpx++ikf/wG9ZBInfoJr+35dasKZ6IQNuW+hzkGHGpVcDX7kkU/ClB
         tOlMHuudp1RAJbGAQ+ssYuORhi8ZXg3ZBCVL5MnQkoNLFL/QAIskG3CJi9R24DyULpC2
         Imbxp5tvmC89SrenWvUjUPzAOkFNe6BPIoCzMxsJgROTD3xC5Kg92aXJT9eI/xpU+Khw
         xqkf7iqa0LuMDJjXTzxnVJISdyR5AyHJl56Vlo3TotBsMQYcFY1KtreB3Wyv2KAZQA5L
         YciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761676106; x=1762280906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwwqbizLme2jEhCIP8tyn9yg6ZUbIw3HVu7qFcIaTlE=;
        b=jagNP4Sfhyabfp39WbMj8zjPYZfiH88IGfz3jpjV/7jYKFfyI5aNxgQpTqLNB5B+3X
         hzfFNQ/AXV3+m0OG11IHCdRiYLZrBsf+TbJP1jUg9Utc/qRb5dUJlgSuf7fFOGnzNZKp
         eO0kBSqtfbBKPWfkwfBzVROnFHU5p8TThbm7l/ileDLjoD1+Lhhe0W+20u05VJIQKEVm
         aA8Z9ABTdFfnd8oC/4I6qxjz5Q3Mg0y28Xy4WBW2fSDwp7GeAu3ZopqhYyd+ul9WQVJ3
         rNnpvFyhfmF6WyT9XiRR3SnW3yhzvOD7wanOQvwe9Yqgqk/UpIpvZcSriK5Ge2Zmcl7m
         RMOw==
X-Forwarded-Encrypted: i=1; AJvYcCXZQHYda/EquHXgLrf9cLya84d4YOZgwFeYXc/0WQIamlcy8WBEmIhheL8HBfEc59Z6ctNZveB9z79JAky/etDRG09gtA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzmcyN4OuNShr+niyiJX4M1mny8jfs6xgR0Ih9bZCQbiKVM/WqH
	kd9Lh8ZcvIit3PgO4qpICi/tQ767PYJcDCZ2OKdp6176RrICGsAD7KCPiOdixLlsneRmBrQmY3v
	IpJYJIUVpsaWc2nR7kTNv6+pAesjCzT/NzokBg+U34l0Dgzr+9WiYPxXr
X-Gm-Gg: ASbGncv83ls0IUUwPFs7YiZIFyUPkc2WNc1ZK0Nv8ZH0Yr0mS7ixBEG12M+8mgja7Qg
	Cv1i33eeWIkkbZ8wsy5RwCoaWkewb+ATMXLiatdK4G12/W0emnZgC0TkMT+mjmnNZlQ0MTxaQF4
	SKYY9i/jG7CX6RA8l69/jn1/lxZPGRei/gIs7JEY61a5KiQ/+UetbLqgMS+DFgrCYfEZy6hp8Mk
	3ZTrBiA4JMBdCqle2os/iahpHA6vxolmbw7iwUqNqj2H3zm+lMKNr28gy9UQUtx/FEPbdYateGT
	/uxljQ2jVk3N+jI=
X-Google-Smtp-Source: AGHT+IHGQgiHurQaRm5BB7XlGFbutHXsTrKesjHVFoO64zS/IwuXtf9Zc3l3Dd5HGQS+OWR2w/kG1Uyuv84suWGXdkw=
X-Received: by 2002:a17:902:e802:b0:279:fa:30fe with SMTP id
 d9443c01a7336-294dee25c62mr1768945ad.26.1761676105954; Tue, 28 Oct 2025
 11:28:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251025190256.11352-1-adelodunolaoluwa.ref@yahoo.com> <20251025190256.11352-1-adelodunolaoluwa@yahoo.com>
In-Reply-To: <20251025190256.11352-1-adelodunolaoluwa@yahoo.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 28 Oct 2025 11:28:14 -0700
X-Gm-Features: AWmQ_bnalw5IhlnCx13TaCPkqkExXAVy8q757FeR1BQMDD21F7CRcXs2Z3K0uq0
Message-ID: <CAAVpQUAbDfaiAZ_NCppGE5vsafWoU7V1xvnqtQQM44cwv6jHsA@mail.gmail.com>
Subject: Re: [PATCH v2] selftests: af_unix: Add tests for ECONNRESET and EOF semantics
To: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
Cc: "=David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	David Hunter <david.hunter.linux@gmail.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 25, 2025 at 12:03=E2=80=AFPM Sunday Adelodun
<adelodunolaoluwa@yahoo.com> wrote:
>
> Add selftests to verify and document Linux=E2=80=99s intended behaviour f=
or
> UNIX domain sockets (SOCK_STREAM and SOCK_DGRAM) when a peer closes.
> The tests cover:
>
>   1. EOF returned when a SOCK_STREAM peer closes normally.
>   2. ECONNRESET returned when a SOCK_STREAM peer closes with unread data.
>   3. SOCK_DGRAM sockets not returning ECONNRESET on peer close.
>
> This follows up on review feedback suggesting a selftest to clarify
> Linux=E2=80=99s semantics.
>
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
> ---
> Changelog:
>
> Changes made from v1:
>
> - Patch prefix updated to selftest: af_unix:.
>
> - All mentions of =E2=80=9CUNIX=E2=80=9D changed to AF_UNIX.
>
> - Removed BSD references from comments.
>
> - Shared setup refactored using FIXTURE_VARIANT().
>
> - Cleanup moved to FIXTURE_TEARDOWN() to always run.
>
> - Tests consolidated to reduce duplication: EOF, ECONNRESET, SOCK_DGRAM p=
eer close.
>
> - Corrected ASSERT usage and initialization style.
>
> - Makefile updated for new directory af_unix.
>
>  tools/testing/selftests/net/af_unix/Makefile  |   1 +
>  .../selftests/net/af_unix/unix_connreset.c    | 161 ++++++++++++++++++
>  2 files changed, 162 insertions(+)
>  create mode 100644 tools/testing/selftests/net/af_unix/unix_connreset.c
>
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
> index 000000000000..c65ec997d77d
> --- /dev/null
> +++ b/tools/testing/selftests/net/af_unix/unix_connreset.c
> @@ -0,0 +1,161 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Selftest for AF_UNIX socket close and ECONNRESET behaviour.
> + *
> + * This test verifies that:
> + *  1. SOCK_STREAM sockets return EOF when peer closes normally.
> + *  2. SOCK_STREAM sockets return ECONNRESET if peer closes with unread =
data.
> + *  3. SOCK_DGRAM sockets do not return ECONNRESET when peer closes.
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
> +/* Define variants: stream and datagram */
> +FIXTURE_VARIANT_ADD(unix_sock, stream) {
> +       .socket_type =3D SOCK_STREAM,
> +       .name =3D "SOCK_STREAM",
> +};
> +
> +FIXTURE_VARIANT_ADD(unix_sock, dgram) {
> +       .socket_type =3D SOCK_DGRAM,
> +       .name =3D "SOCK_DGRAM",
> +};

Let's add coverage for SOCK_SEQPACKET,
which needs listen() / connect() but other semantics
are similar to SOCK_DGRAM.


> +
> +FIXTURE_SETUP(unix_sock)
> +{
> +       struct sockaddr_un addr =3D {};
> +       int err;
> +
> +       addr.sun_family =3D AF_UNIX;
> +       strcpy(addr.sun_path, SOCK_PATH);
> +
> +       self->server =3D socket(AF_UNIX, variant->socket_type, 0);
> +       ASSERT_LT(-1, self->server);
> +
> +       err =3D bind(self->server, (struct sockaddr *)&addr, sizeof(addr)=
);
> +       ASSERT_EQ(0, err);
> +
> +       if (variant->socket_type =3D=3D SOCK_STREAM) {
> +               err =3D listen(self->server, 1);
> +               ASSERT_EQ(0, err);
> +
> +               self->client =3D socket(AF_UNIX, SOCK_STREAM, 0);
> +               ASSERT_LT(-1, self->client);
> +
> +               err =3D connect(self->client, (struct sockaddr *)&addr, s=
izeof(addr));
> +               ASSERT_EQ(0, err);
> +
> +               self->child =3D accept(self->server, NULL, NULL);
> +               ASSERT_LT(-1, self->child);
> +       } else {
> +               /* Datagram: bind and connect only */
> +               self->client =3D socket(AF_UNIX, SOCK_DGRAM | SOCK_NONBLO=
CK, 0);
> +               ASSERT_LT(-1, self->client);
> +
> +               err =3D connect(self->client, (struct sockaddr *)&addr, s=
izeof(addr));
> +               ASSERT_EQ(0, err);
> +       }
> +}
> +
> +FIXTURE_TEARDOWN(unix_sock)
> +{
> +       if (variant->socket_type =3D=3D SOCK_STREAM)
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
> +       if (variant->socket_type !=3D SOCK_STREAM)
> +               SKIP(return, "This test only applies to SOCK_STREAM");

Instead of skipping, let's define final ASSERT() results
for each type.

Same for other 2 tests.


> +
> +       /* Peer closes normally */
> +       close(self->child);
> +
> +       n =3D recv(self->client, buf, sizeof(buf), 0);
> +       TH_LOG("%s: recv=3D%zd errno=3D%d (%s)", variant->name, n, errno,=
 strerror(errno));
> +       if (n =3D=3D -1)
> +               ASSERT_EQ(ECONNRESET, errno);

... otherwise, we don't see an error here

> +
> +       if (n !=3D -1)
> +               ASSERT_EQ(0, n);

and this can be checked unconditionally.


> +}
> +
> +/* Test 2: peer closes with unread data */
> +TEST_F(unix_sock, reset_unread)
> +{
> +       char buf[16] =3D {};
> +       ssize_t n;
> +
> +       if (variant->socket_type !=3D SOCK_STREAM)
> +               SKIP(return, "This test only applies to SOCK_STREAM");
> +
> +       /* Send data that will remain unread by client */
> +       send(self->client, "hello", 5, 0);
> +       close(self->child);
> +
> +       n =3D recv(self->client, buf, sizeof(buf), 0);
> +       TH_LOG("%s: recv=3D%zd errno=3D%d (%s)", variant->name, n, errno,=
 strerror(errno));
> +       ASSERT_EQ(-1, n);
> +       ASSERT_EQ(ECONNRESET, errno);
> +}
> +
> +/* Test 3: SOCK_DGRAM peer close */
> +TEST_F(unix_sock, dgram_reset)
> +{
> +       char buf[16] =3D {};
> +       ssize_t n;
> +
> +       if (variant->socket_type !=3D SOCK_DGRAM)
> +               SKIP(return, "This test only applies to SOCK_DGRAM");
> +
> +       send(self->client, "hello", 5, 0);
> +       close(self->server);
> +
> +       n =3D recv(self->client, buf, sizeof(buf), 0);
> +       TH_LOG("%s: recv=3D%zd errno=3D%d (%s)", variant->name, n, errno,=
 strerror(errno));
> +       /* Expect EAGAIN because there is no datagram and peer is closed.=
 */
> +       ASSERT_EQ(-1, n);
> +       ASSERT_EQ(EAGAIN, errno);
> +}
> +
> +TEST_HARNESS_MAIN
> +
> --
> 2.43.0
>
