Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB955261B9E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  2 Nov 2025 07:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762068770; cv=none; b=OrJvZw3qsdD7Y46VIvLYMOuVx3kbNynpzqiWFbVWhAkcFSjdAG126EHom6NFVAMqRchVG9AyPuX0amWeGHX/SrDQcwM+NH7UegLvDsR1Fw64cmJjc1V7UbfDN7m2V0cAFfVpJVBv85Vdz+1wTMyTEwLnPbQaL1N0Y/K/QLVfiI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762068770; c=relaxed/simple;
	bh=X5GGfT0Fb6Pdwjs1LDTMtk3l4izdSvji14DLk1KDCeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HANwXx51HrA0UZjotfvaLeWrZ8j4t+oZ+07uSf/asz9FUv38ItChZcNxrSd+5sPamt6630N0UHFbI3/6NHCnaqXY0gUP/53WCADkpFglvH+tDRc8YyCSt0keMqAXZLMl+YsSw1v+nOjrlckymy509B7V0gZcNjyauPwSM139Qpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2tKkygZn; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2tKkygZn"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 816AB8524B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  2 Nov 2025 07:32:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LrU303ZwHClj for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Nov 2025 07:32:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=kuniyu@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 589A28515B
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 589A28515B
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2tKkygZn
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 589A28515B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  2 Nov 2025 07:32:45 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2956d816c10so6663185ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 02 Nov 2025 00:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762068764; x=1762673564; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psmfYF2mFpi74h7bmYecR+gj0aBVviR4E8MTUa1Jbhc=;
        b=2tKkygZnu04lPGjoVb/nKSmyQ7aXQsqXp5end2RiubxN/QtH42miQ5KWN14uoC7ikH
         siNuGD4+jqEFoWtEGy/mZuIpobLRQq0fGxbFotlutwHzTS8ziwlS7BmP+iMxk4JvvXtA
         CyCXdbXDafh7WchxynndkQrbw9QY5YUxbAWcBObZKnr14x/ZknrRFwBj0WFmlDW/yayK
         dw3Nk34JnlqW0qvIOCE/ldkg0NBf0edDLqtzdID0nHV0X384Ir0TgusE1MmFod6ECEsq
         0HJB8ArXBMgvQePVCrZGvmTx8QIQOgmaBl00yWn4TD75Ll1tkotRTuqjuw1m06UAfoQV
         z8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762068764; x=1762673564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psmfYF2mFpi74h7bmYecR+gj0aBVviR4E8MTUa1Jbhc=;
        b=lxFCbYjblQ85e3C5h+8KYsvjBki6K++w3gJXZDnZei+wKd1XYWIFQxjGoVcl1ZAzSW
         0ko/OIc9p0i/m0wmFKMoiwmlTCrP65R9ddYdleQ63RVJytYMJ25NnGtuyjK/ZUsT2Rhf
         aHpI2GcLwX1p4Jzqq38+eOlLU8fh9yDRw+0GBNU2aIVrygDcUSq56m2OzClbsMYNGjfl
         yr6qtZnPrlXzF7W0T3wFXYFC+bFo/j6GnmwgZ8oNazgjN1mG5uKOljU3Kx13IVSxD8sa
         nu2ODZkFhglBuNY9giDAhMWNAbOi8+xc/kH0OH0AGqro1YCJ+NZEX7Ng463EIBcX7nNT
         avCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUevTXJMAPJ+3Nx9W573VjB9rEt6l04lypVY8LBkiSXYsT3evWVEDKhe5LolxLRpj4BH0oiw7a6ciEE2QZVq0updH6e9g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxjePI8FLNDfe0Qbyt0IsT5Yp5FKtSP8BX6aQYDxid8fwat0v5+
	5ivQ/us/+0c6P4rYyxAHV9IHaDi/aAzbFoeG2YLqM7RIkm6nUZOaqHMs5Dw444QLgwnMRdB/fBR
	B13Rna8EUIvxaj3tJZem4PncJ9e3qCuikUbYsTfW4
X-Gm-Gg: ASbGncs4NaGnTxn2YFBR8OtKJl7c1q32ky1xEYcj0Oe1B7QzfOykdqk3/ZqyTahIFrk
	wEEIT7t0JKQhwSCXpWwOEZmMEUQIrj14JHr1wynJcLOJF9mvy+MN5IHxS5P8ZrkqiVdOq5gKIaK
	8nHnrUs/D+4wMBGaMJP55QVkdHVbA7RLfXZwxrg1wajVJKL241uvyasBrzJV4SkmZRaJC2YoDit
	zY1aNUqs5jIKI4aBcuSiNdLpUgj4JMrigjZbXQpIyIoF2RvEuqYKzJcuasBeSWLU6bPbXEvLWQ0
	tdAfMM4swa+fDf1hi8RTl7f4/RmI
X-Google-Smtp-Source: AGHT+IFbW7bCQJ0PZWFIhPoBoJbyq4L78a2Dn1ShTaa+crTgaOBXNBIsSdR20e5FJO4cGtyCHIdPcl2p5BJao9hsgSg=
X-Received: by 2002:a17:902:f60c:b0:295:9cb5:ae2a with SMTP id
 d9443c01a7336-2959cb5b3a5mr9776895ad.9.1762068764144; Sun, 02 Nov 2025
 00:32:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251101172230.10179-1-adelodunolaoluwa.ref@yahoo.com> <20251101172230.10179-1-adelodunolaoluwa@yahoo.com>
In-Reply-To: <20251101172230.10179-1-adelodunolaoluwa@yahoo.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sun, 2 Nov 2025 00:32:32 -0700
X-Gm-Features: AWmQ_bl-AuPwDhpPjaIEpKjwp_zIOpPzGuKKuWV51VIxF5js7Nyb6hFeYlKzfqQ
Message-ID: <CAAVpQUDL1FB1nFYOZ6QuO+cGTqnpYNSaFtFD=YN742pyspe9ew@mail.gmail.com>
Subject: Re: [PATCH v3] selftests: af_unix: Add tests for ECONNRESET and EOF semantics
To: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 1, 2025 at 10:23=E2=80=AFAM Sunday Adelodun
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
>  tools/testing/selftests/net/af_unix/Makefile  |   1 +
>  .../selftests/net/af_unix/unix_connreset.c    | 179 ++++++++++++++++++
>  2 files changed, 180 insertions(+)
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

patchwork caught this test is not added to .gitignore.
https://patchwork.kernel.org/project/netdevbpf/patch/20251101172230.10179-1=
-adelodunolaoluwa@yahoo.com/

Could you add it to this file ?

tools/testing/selftests/net/.gitignore


>  # end of TEST_GEN_PROGS
>
>  include ../../lib.mk
> diff --git a/tools/testing/selftests/net/af_unix/unix_connreset.c b/tools=
/testing/selftests/net/af_unix/unix_connreset.c
> new file mode 100644
> index 000000000000..6f43435d96e2
> --- /dev/null
> +++ b/tools/testing/selftests/net/af_unix/unix_connreset.c
> @@ -0,0 +1,179 @@
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
> +/* Define variants: stream and datagram */

nit: outdated, maybe simply remove ?

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
> +               variant->socket_type =3D=3D SOCK_SEQPACKET) {

patchwork caught mis-alignment here and other places.

I'm using this for emacs, and other editors will have a similar config.

(setq-default c-default-style "linux")

You can check if lines are aligned properly by

$ git show --format=3Demail | ./scripts/checkpatch.pl


> +               err =3D listen(self->server, 1);
> +               ASSERT_EQ(0, err);
> +
> +               self->client =3D socket(AF_UNIX, variant->socket_type, 0)=
;

Could you add SOCK_NONBLOCK here too ?


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
> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> +               variant->socket_type =3D=3D SOCK_SEQPACKET)
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
> +       /* Peer closes normally */
> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> +               variant->socket_type =3D=3D SOCK_SEQPACKET)
> +               close(self->child);
> +       else
> +               close(self->server);
> +
> +       n =3D recv(self->client, buf, sizeof(buf), 0);
> +       TH_LOG("%s: recv=3D%zd errno=3D%d (%s)", variant->name, n, errno,=
 strerror(errno));

errno is undefined if not set, and same for strerror(errno).

Also, if ASSERT_XXX() below fails, the same information
(test case, errno) is logged.  So, TH_LOG() seems unnecessary.

Maybe try modifying the condition below and see how the
assertion is logged.

> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> +               variant->socket_type =3D=3D SOCK_SEQPACKET) {
> +               ASSERT_EQ(0, n);
> +       } else {
> +               ASSERT_EQ(-1, n);
> +               ASSERT_EQ(EAGAIN, errno);
> +       }
> +}
> +
> +/* Test 2: peer closes with unread data */
> +TEST_F(unix_sock, reset_unread)
> +{
> +       char buf[16] =3D {};
> +       ssize_t n;
> +
> +       /* Send data that will remain unread by client */
> +       send(self->client, "hello", 5, 0);
> +       close(self->child);
> +
> +       n =3D recv(self->client, buf, sizeof(buf), 0);
> +       TH_LOG("%s: recv=3D%zd errno=3D%d (%s)", variant->name, n, errno,=
 strerror(errno));
> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> +               variant->socket_type =3D=3D SOCK_SEQPACKET) {
> +               ASSERT_EQ(-1, n);
> +               ASSERT_EQ(ECONNRESET, errno);
> +       } else {
> +               ASSERT_EQ(-1, n);
> +               ASSERT_EQ(EAGAIN, errno);
> +       }
> +}
> +
> +/* Test 3: SOCK_DGRAM peer close */

Now Test 2 and Test 3 look identical ;)

Thanks!

> +TEST_F(unix_sock, dgram_reset)
> +{
> +       char buf[16] =3D {};
> +       ssize_t n;
> +
> +       send(self->client, "hello", 5, 0);
> +       close(self->server);
> +
> +       n =3D recv(self->client, buf, sizeof(buf), 0);
> +       TH_LOG("%s: recv=3D%zd errno=3D%d (%s)", variant->name, n, errno,=
 strerror(errno));
> +       if (variant->socket_type =3D=3D SOCK_STREAM ||
> +               variant->socket_type =3D=3D SOCK_SEQPACKET) {
> +               ASSERT_EQ(-1, n);
> +               ASSERT_EQ(ECONNRESET, errno);
> +       } else {
> +               ASSERT_EQ(-1, n);
> +               ASSERT_EQ(EAGAIN, errno);
> +       }
> +}
> +
> +TEST_HARNESS_MAIN
> +
> --
> 2.43.0
>
