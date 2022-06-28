Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74DFC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jun 2022 02:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CBE282FB1;
	Tue, 28 Jun 2022 02:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CBE282FB1
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=xEa7SPBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4EoZoLuACH1; Tue, 28 Jun 2022 02:01:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AC86482784;
	Tue, 28 Jun 2022 02:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC86482784
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82257C0039;
	Tue, 28 Jun 2022 02:01:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C3F6C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 02:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FBDF60B8C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 02:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FBDF60B8C
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com
 header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=xEa7SPBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEAJUV8g8gnh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 02:01:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8029260777
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8029260777
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 02:01:56 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id w83so15389722oiw.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jun 2022 19:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=csp-edu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=XuQbfuu2O5AvmaBbsFRbfikha2jwFbRMfbreOV/hlYM=;
 b=xEa7SPBEduBFYjkS6ZPMvJDxoI1yZ8klieYW1HVQvSaT4dflf7BYFp6D49P1g9J+hE
 ONjiM9o7nH/Pdko5BQ0JFRNGSxmw/dK57I7oXnllMR7VTRM4+npcByLV1IVpxAsZ6Ls/
 SNsFagYLUCg29P0KLqSCNFFZ+swjedNf8ZRcLaDZ3UNNxglf2UUYm3zV4CyrWjIgfyR7
 Mfef7ocj5pguhTLjSwNUj4TodbSMRpenR12MigOR3sAzcXv/2bAF/tM+tmhDehWDQTET
 hZgCZDBqVQJVo5u+hYtI0kTPeREEpZ7DlYIOqlukMLxWCX15cOo2lMLEabqMUKrua5Ud
 oUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=XuQbfuu2O5AvmaBbsFRbfikha2jwFbRMfbreOV/hlYM=;
 b=bwH3mr6hxoFQ26rIVW7EkfrSYwAmw+lAyLg72MGxN+cyGUL/nd9N3WwPMHp9EzDrxE
 cAJbaSR6OEPuD/05yMkIx0fErl7GuS5kkOBXX6eCLGSmSBLQ94bbOQmPw4RTwEnsDiLd
 0K2/wglI1xMrZT9NKfCjQraBIihkKlBQaAnBcVdVWQGX5mtyRcenNfyn6GUlMU5DSYbf
 d1fSkST3eytWkzqlTY8xELVXF/K2ntGhyRMkm+Ss8TfJD5xYoJ5V4owbICd0svZy0FYv
 F7IVfXdiRdpKV4csWrA8wsbWYcHekRDM/IW6BmUevmJvmgA5nQvAC0zMW/SyubF4yxpX
 EJNw==
X-Gm-Message-State: AJIora+qThGYFg+za+6W/GQyTpHalaCR9B7Z4vGlsVFPFSrWo3Zq65ry
 yxlMkZurN4q8Brko0FSD5B2+V+255z6+jcmaUkrm8g==
X-Google-Smtp-Source: AGRyM1uVsi9rbjpTOZP/Ouho7qDgmdeqzxdAUSmBv9web2b8TGI14MrrLqxwlsHbzPDW1pFWvWHNQ+5CmFBxN7efnxM=
X-Received: by 2002:a05:6808:1641:b0:335:4fe8:14d3 with SMTP id
 az1-20020a056808164100b003354fe814d3mr10045622oib.231.1656381715483; Mon, 27
 Jun 2022 19:01:55 -0700 (PDT)
MIME-Version: 1.0
From: Coleman Dietsch <dietschc@csp.edu>
Date: Mon, 27 Jun 2022 21:01:44 -0500
Message-ID: <CABvydfJ+zEQSh3kVaLdHG5_HwnJ_MrQr-gDMJVRAQe2OJ-gKSA@mail.gmail.com>
Subject: [PATCH] docs: fix include path causing kselftest net fatal error
To: Shuah Khan <skhan@linuxfoundation.org>, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Eric Dumazet <edumazet@google.com>, davem@davemloft.net, kuba@kernel.org, 
 pabeni@redhat.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
 kafai@fb.com
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7686597424861232145=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============7686597424861232145==
Content-Type: multipart/alternative; boundary="000000000000c3a5f005e2786b2e"

--000000000000c3a5f005e2786b2e
Content-Type: text/plain; charset="UTF-8"

The incorrect path is causing the following error when trying to run net
kselftests:

clang -O2 -target bpf -c bpf/nat6to4.c -I../../bpf -I../../../lib
-I../../../../../usr/include/ -o
/home/cole/Development/linux/tools/testing/selftests/net/bpf/nat6to4.o
In file included from bpf/nat6to4.c:43:
../../../lib/bpf/bpf_helpers.h:11:10: fatal error: 'bpf_helper_defs.h' file
not found
         ^~~~~~~~~~~~~~~~~~~
1 error generated.

Signed-off-by: Coleman Dietsch <dietschc@csp.edu>
---
 tools/testing/selftests/net/bpf/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/bpf/Makefile
b/tools/testing/selftests/net/bpf/Makefile
index 8a69c91fcca0..8ccaf8732eb2 100644
--- a/tools/testing/selftests/net/bpf/Makefile
+++ b/tools/testing/selftests/net/bpf/Makefile
@@ -2,7 +2,7 @@

 CLANG ?= clang
 CCINCLUDE += -I../../bpf
-CCINCLUDE += -I../../../lib
+CCINCLUDE += -I../../../../lib
 CCINCLUDE += -I../../../../../usr/include/

 TEST_CUSTOM_PROGS = $(OUTPUT)/bpf/nat6to4.o
-- 
2.34.1

--000000000000c3a5f005e2786b2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The incorrect path is causing the following error when try=
ing to run net<br>kselftests:<br><br>clang -O2 -target bpf -c bpf/nat6to4.c=
 -I../../bpf -I../../../lib -I../../../../../usr/include/ -o /home/cole/Dev=
elopment/linux/tools/testing/selftests/net/bpf/nat6to4.o<br>In file include=
d from bpf/nat6to4.c:43:<br>../../../lib/bpf/bpf_helpers.h:11:10: fatal err=
or: &#39;bpf_helper_defs.h&#39; file not found<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~~~~~~~~~~<br>1 error generated.<br><br>Signed-off-by: C=
oleman Dietsch &lt;<a href=3D"mailto:dietschc@csp.edu">dietschc@csp.edu</a>=
&gt;<br>---<br>=C2=A0tools/testing/selftests/net/bpf/Makefile | 2 +-<br>=C2=
=A01 file changed, 1 insertion(+), 1 deletion(-)<br><br>diff --git a/tools/=
testing/selftests/net/bpf/Makefile b/tools/testing/selftests/net/bpf/Makefi=
le<br>index 8a69c91fcca0..8ccaf8732eb2 100644<br>--- a/tools/testing/selfte=
sts/net/bpf/Makefile<br>+++ b/tools/testing/selftests/net/bpf/Makefile<br>@=
@ -2,7 +2,7 @@<br>=C2=A0<br>=C2=A0CLANG ?=3D clang<br>=C2=A0CCINCLUDE +=3D =
-I../../bpf<br>-CCINCLUDE +=3D -I../../../lib<br>+CCINCLUDE +=3D -I../../..=
/../lib<br>=C2=A0CCINCLUDE +=3D -I../../../../../usr/include/<br>=C2=A0<br>=
=C2=A0TEST_CUSTOM_PROGS =3D $(OUTPUT)/bpf/nat6to4.o<br>-- <br>2.34.1<br></d=
iv>

--000000000000c3a5f005e2786b2e--

--===============7686597424861232145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7686597424861232145==--
