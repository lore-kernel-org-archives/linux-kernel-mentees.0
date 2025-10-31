Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81DF310627
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 31 Oct 2025 19:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761939704; cv=none; b=UgC6bc5rPWibKlqMWD5Kf2YtBwSPMsvtaPBi1oPgkVPl9Kh6rmczr+HHtV9mOOiFyVdOHledQ0hM9CeHL86p7j7YgEqZQSlZ6THyko8U4nyaqtaZm20fBeKjfVvAyYTiqbIr5EwPhJ+3sHZq2/NbQP1HgHKaaiHJ3bf4nW4ljEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761939704; c=relaxed/simple;
	bh=maRK7XpfoR92vY8Ydni5YVMz4/Px/3eFRr8cqwFVDz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QtmphYeVyZIn8NWilaJjyNmrKCPExTJdgjxNx+h7ote9uRtuQfe06mZAkFOEIrO5sdSz3hPkwkAdkBBdC1+AQWOTLDfGL9QAPid/AJp+5W2DhBBS1n+XE/M3WDqpueWOJC/zNTMJ6Nn3KZOUTNXCdeAPPjNdpuekxolJ5AC0+Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H0YenwWE; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H0YenwWE"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F68861798
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 31 Oct 2025 19:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpBEil5I7KNj for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Oct 2025 19:41:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=kuniyu@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2134061796
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2134061796
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=H0YenwWE
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2134061796
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 31 Oct 2025 19:41:40 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-63d6ee383bdso5691804a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 31 Oct 2025 12:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761939699; x=1762544499; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYbfNT0Vc8/TiytLOjgG9hBzeApOsG89ichqEMIxreo=;
        b=H0YenwWE2ayf7We+hSVWFO3gbpO1apc/aGp5xYfPTdTh1QguqoS8sv3+B8jKlzD19q
         5aeuihUSLgNBeR6sAYq1OKQ7BQ3SCxlk6oClGaYbZa2pEO73ZsbSRpa2Wk9SIFzdktri
         x1RnxflQknUZmrSUI9GgGwVQKwBBCquz2JS4Y2spvOyTajH4St37Q5EstF4kWChrLbVl
         AfLb6ZwwqRTaRRUIE93YjEGVkeWBKfiBgmlhrqkRQ+ZhQzJEhVqH0zz+vo3M+eI53ybZ
         Nww6U+zECxZ/fVGLrzSKYgXK3HC5PIlKNm+na9JgBnhRSROkSU9ObRzHt37cZdXhADML
         bUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761939699; x=1762544499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYbfNT0Vc8/TiytLOjgG9hBzeApOsG89ichqEMIxreo=;
        b=FhNhNRyZkmdNZstEXWbMZyOJwVf/VDuHuQpcU59ofm32XQRshxtt72IIJWvFJLTQLC
         B0e4ANO/ugVVRDA1sFUktPvyqN9RaWU+nF6N97/nNwALU9tBQ+RUS7yW/HvqT+YWnXPV
         frI2/3TW3iDnPK3FdVqnJGP0sXgs2M8TKPcZq+uvz7Mv5O9rEjNjzWPjRiXJrciuofEi
         uoBwinofexOY6TYgjfWaqIFDmdRJ78SIHJuO8IywN3VanHt6Jc2LvCwiqGqMUdn+wo+Q
         gfXPE6i/UOihKuEjxMe1i5jcVpRVqQii2w7v1w7o06+NtbLiRLKESAQYNnq3JHQ5duL+
         0eqA==
X-Forwarded-Encrypted: i=1; AJvYcCXtULp5cp0l4AsZ3RFRE7bbGsFcLOmjIlpqkckeksBOzpNIlHyb55Wk7RtAjCfvmrbl6RfSp1TKTqtjYHO9xqmxPkU7nQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzkAcwZPWyuz6xAegASr1VaWn819Sg7OJZ9GWY2BI/aITD9Tyuq
	+EmldKeLxPooNE58D4LIlKWDzQOXUnE1mJAfPEzt7MlKl+cFRBGutOmGlMsXv7BlRZ9wKaySG4T
	rZr4dRvSjXBP1JHTObVHZ9Jiwf7xB+3c8P4lxYjvp
X-Gm-Gg: ASbGncucMkJBB0JBheyDqib8B0rFOWDHUJq8oG7/qoKCmo0A3D3YiMsAnCnNx3S2XW3
	iMQpVCXKeauJIh9AP+miDXIjDoJZoAFhEgi4jBrpDlDkOEJHyEnJETOiYSSY/UwCLW5nvyLMBst
	LEnMJ0zBWJOSeEDc21jXo178ecPW5zH6zIOXPh2FSEpxDUgST6IKyOkFbc/UaN/TetVyWP3q4CB
	l+71xPS8tww0woeC0jgPcFUFgv0utY4ddFV/3UHZ3W7v++jBjen4FiZGt0E7D4Nz3TrDtkjre8+
	xDJYN0XfYPhJvNEFVw==
X-Google-Smtp-Source: AGHT+IGP39uKZ8Ldsc5A2MSKFDiQ/EXttriDPIq9JhsO1OWBc5tum20Be7vZowWj6ukKGFaTckz2hYue61ejofW9WFY=
X-Received: by 2002:a05:6402:274b:b0:634:6bca:2d1c with SMTP id
 4fb4d7f45d1cf-64077081fafmr4171016a12.26.1761939698354; Fri, 31 Oct 2025
 12:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251025190256.11352-1-adelodunolaoluwa.ref@yahoo.com>
 <20251025190256.11352-1-adelodunolaoluwa@yahoo.com> <CAAVpQUAbDfaiAZ_NCppGE5vsafWoU7V1xvnqtQQM44cwv6jHsA@mail.gmail.com>
 <7c4070ed-1702-4288-90c6-7edb90468718@yahoo.com>
In-Reply-To: <7c4070ed-1702-4288-90c6-7edb90468718@yahoo.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 31 Oct 2025 12:41:22 -0700
X-Gm-Features: AWmQ_bn_XVrMh5WLNVzJVx0p1VBoVnrz3YR-LeQYxE8Gmud4G1IaBv7E36TYekY
Message-ID: <CAAVpQUAT8CVwQfSXq+P78kgPVy8gyD9thEgBcAz45Jpxh=1smw@mail.gmail.com>
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

On Thu, Oct 30, 2025 at 6:45=E2=80=AFAM Sunday Adelodun
<adelodunolaoluwa@yahoo.com> wrote:
>
> On 10/28/25 19:28, Kuniyuki Iwashima wrote:
> > On Sat, Oct 25, 2025 at 12:03=E2=80=AFPM Sunday Adelodun
> > <adelodunolaoluwa@yahoo.com> wrote:
> >> Add selftests to verify and document Linux=E2=80=99s intended behaviou=
r for
> >> UNIX domain sockets (SOCK_STREAM and SOCK_DGRAM) when a peer closes.
> >> The tests cover:
> >>
> >>    1. EOF returned when a SOCK_STREAM peer closes normally.
> >>    2. ECONNRESET returned when a SOCK_STREAM peer closes with unread d=
ata.
> >>    3. SOCK_DGRAM sockets not returning ECONNRESET on peer close.
> >>
> >> This follows up on review feedback suggesting a selftest to clarify
> >> Linux=E2=80=99s semantics.
> >>
> >> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> >> Signed-off-by: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
> >> ---
> >> Changelog:
> >>
> >> Changes made from v1:
> >>
> >> - Patch prefix updated to selftest: af_unix:.
> >>
> >> - All mentions of =E2=80=9CUNIX=E2=80=9D changed to AF_UNIX.
> >>
> >> - Removed BSD references from comments.
> >>
> >> - Shared setup refactored using FIXTURE_VARIANT().
> >>
> >> - Cleanup moved to FIXTURE_TEARDOWN() to always run.
> >>
> >> - Tests consolidated to reduce duplication: EOF, ECONNRESET, SOCK_DGRA=
M peer close.
> >>
> >> - Corrected ASSERT usage and initialization style.
> >>
> >> - Makefile updated for new directory af_unix.
> >>
> >>   tools/testing/selftests/net/af_unix/Makefile  |   1 +
> >>   .../selftests/net/af_unix/unix_connreset.c    | 161 ++++++++++++++++=
++
> >>   2 files changed, 162 insertions(+)
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
> >>   # end of TEST_GEN_PROGS
> >>
> >>   include ../../lib.mk
> >> diff --git a/tools/testing/selftests/net/af_unix/unix_connreset.c b/to=
ols/testing/selftests/net/af_unix/unix_connreset.c
> >> new file mode 100644
> >> index 000000000000..c65ec997d77d
> >> --- /dev/null
> >> +++ b/tools/testing/selftests/net/af_unix/unix_connreset.c
> >> @@ -0,0 +1,161 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Selftest for AF_UNIX socket close and ECONNRESET behaviour.
> >> + *
> >> + * This test verifies that:
> >> + *  1. SOCK_STREAM sockets return EOF when peer closes normally.
> >> + *  2. SOCK_STREAM sockets return ECONNRESET if peer closes with unre=
ad data.
> >> + *  3. SOCK_DGRAM sockets do not return ECONNRESET when peer closes.
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
> >> +FIXTURE_VARIANT_ADD(unix_sock, stream) {
> >> +       .socket_type =3D SOCK_STREAM,
> >> +       .name =3D "SOCK_STREAM",
> >> +};
> >> +
> >> +FIXTURE_VARIANT_ADD(unix_sock, dgram) {
> >> +       .socket_type =3D SOCK_DGRAM,
> >> +       .name =3D "SOCK_DGRAM",
> >> +};
> > Let's add coverage for SOCK_SEQPACKET,
> > which needs listen() / connect() but other semantics
> > are similar to SOCK_DGRAM.
>
> I will add it through:
> if (variant->socket_type =3D=3D SOCK_STREAM ||
>                 variant->socket_type =3D=3D SOCK_SEQPACKET)
>
>
> in both the setup and teardown fixtures with a little bit of modification
>
> where necessary (especially in the setup fixture).
>
> And also the fixture_variant_add macro.
>
> >> +
> >> +FIXTURE_SETUP(unix_sock)
> >> +{
> >> +       struct sockaddr_un addr =3D {};
> >> +       int err;
> >> +
> >> +       addr.sun_family =3D AF_UNIX;
> >> +       strcpy(addr.sun_path, SOCK_PATH);
> >> +
> >> +       self->server =3D socket(AF_UNIX, variant->socket_type, 0);
> >> +       ASSERT_LT(-1, self->server);
> >> +
> >> +       err =3D bind(self->server, (struct sockaddr *)&addr, sizeof(ad=
dr));
> >> +       ASSERT_EQ(0, err);
> >> +
> >> +       if (variant->socket_type =3D=3D SOCK_STREAM) {
> >> +               err =3D listen(self->server, 1);
> >> +               ASSERT_EQ(0, err);
> >> +
> >> +               self->client =3D socket(AF_UNIX, SOCK_STREAM, 0);
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
> >> +       if (variant->socket_type =3D=3D SOCK_STREAM)
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
> >> +       if (variant->socket_type !=3D SOCK_STREAM)
> >> +               SKIP(return, "This test only applies to SOCK_STREAM");
> > Instead of skipping, let's define final ASSERT() results
> > for each type.
> >
> > Same for other 2 tests.
>
> can I use a switch statement in all the tests? say, for example

switch() is completely fine, but I guess "if" will be shorter :)

>
> test1:
>
> ...
>
> switch (variant->socket_type) {
>
> case SOCK_STREAM:
>
> case SOCK_SEQPACKET:
>
>          ASSERT_EQ(0, n);

You need break; here.

>
> case SOCK_DGRAM:
>
>          ASSERT(-1, n);
>
>          ASSERT_EQ(EAGAIN, errno);
>
>          break;

And also please make sure the compiler will not complain
without default: depending on inherited build options.

>
> }
>
> ...
>
> test2:
>
> ...
>
> switch (variant->socket_type) {
>
> case SOCK_STREAM:
>
> case SOCK_SEQPACKET:
>
>          ASSERT_EQ(-1, n);
>
>          ASSERT_EQ(ECONNRESET, errno);
>
>          break;
>
> case SOCK_DGRAM:
>
>          ASSERT(-1, n);
>
>          ASSERT_EQ(EAGAIN, errno);
>
>          break;
>
> }
> ...
>
> test 3:
>
> ...
>
> switch (variant->socket_type) {
>
> case SOCK_STREAM:
>
> case SOCK_SEQPACKET:
>
>          ASSERT_EQ(-1, n);
>
>          ASSERT_EQ(ECONNRESET, errno);
>
>          break;
>
> case SOCK_DGRAM:
>
>          ASSERT(-1, n);
>
>          ASSERT_EQ(EAGAIN, errno);
>
>          break;
>
> }
>
> ...
>
> if not these, could you kindly shed more light to what you meant
>
> >
> >
> >> +
> >> +       /* Peer closes normally */
> >> +       close(self->child);
> >> +
> >> +       n =3D recv(self->client, buf, sizeof(buf), 0);
> >> +       TH_LOG("%s: recv=3D%zd errno=3D%d (%s)", variant->name, n, err=
no, strerror(errno));
> >> +       if (n =3D=3D -1)
> >> +               ASSERT_EQ(ECONNRESET, errno);
> > ... otherwise, we don't see an error here
> >
> >> +
> >> +       if (n !=3D -1)
> >> +               ASSERT_EQ(0, n);
> > and this can be checked unconditionally.
> did you mean I should remove the if (n !=3D -1) ASSERT_EQ(0, n); part?

If SOCK_DGRAM does not reuse this test, yes.

The point is we do not want to miss future regression by
preparing both if (n =3D=3D -1) case and if  (n =3D=3D 0) case, one
of which should never happen at this point.

Thanks!
