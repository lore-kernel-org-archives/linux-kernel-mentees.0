Return-Path: <SRS0=DUpp=CW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95DAC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 18:23:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32F152098B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 18:23:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQNp2tVQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32F152098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CC43984828;
	Sun, 13 Sep 2020 18:23:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vfvodcebhtmW; Sun, 13 Sep 2020 18:23:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 56A1784771;
	Sun, 13 Sep 2020 18:23:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43455C0864;
	Sun, 13 Sep 2020 18:23:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1790C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 18:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ADA4A84821
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 18:23:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xvi4QfnhX6mP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 18:23:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1CF3B84771
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 18:23:38 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id i17so15364965oig.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B/PIJDJXLHw0jOWwOQCRC3NLOUOfGtuhE+7a1kovfoY=;
 b=OQNp2tVQqtCeIyj5okzbEsa/76luwxXePf1+l/g3e8okuhGZgz4cGQmmd6iYPTbMhE
 zKxJ1+IkjiOjFZBIsWeZ4MXKKgfko/dmnw1AlYGP7FWLxE0xXG6ohhyCZgaotfHp72IC
 cTk7Q3indOO7IWCL/w5PEB/q76p6CBGlJ9Vv0M/H2IZPa2RczFhwwjUzazdu3mEOFnKN
 +PbUZZOL7yD756vCS6T+7UGQKuS6HsqRW+C+Eq9y+/D+Wue1bYDchB1tXPNGYzcPOsh4
 6QI+692ClffycAPGrxRS5FaxlRrsc4TP5oHnmAUgzBtFQHdHGMxmbtb2imB0t5xNnLZW
 IzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B/PIJDJXLHw0jOWwOQCRC3NLOUOfGtuhE+7a1kovfoY=;
 b=RuQG7Yzcbne6IPnImSfU8A0d++5C5WOf0oV7Jo0GgxmWQIMg7ZIdzFoIR01EG+X8SH
 hDSnoKiLvYRAJBf+iU1fuS8fItmC/Bbqo6Ct1voZMxlOOOb8o7l8FUgsxlaTEXbWV9kp
 SgPrfrCWlfua42/ljTsPiD2LL14j91NjnLDjh3Hndqrk1za7HUNZrSudh6n7V7OsoMCG
 bkQODrpzeqZTLxxkmQTHOtWXXhmN4qeFXeXlax93LY/bviTfH+p8dyGfXcA/P3+8eGz0
 S/iLMuaOH3z8sOj/MY5/6KDgyKJN4LWFmlvV4vHyC3gkUg4dWxd1kVwiCQABIPl+57dE
 IWZA==
X-Gm-Message-State: AOAM531xaOSmKNtFTyhdALomOchrgosfmJjBh5OHSIUsBf5gM6iFyJlu
 KVKj5EtQx1X4uA6Okw7yD+OtvH2itwqiRB+MU00=
X-Google-Smtp-Source: ABdhPJyXFHhRpUhUhjezHEZQOVgFGmWBs8NIVuaFXIyOslisvDglnvwVph5ELnfzUds8K1JpRaeizzwOOdVrw4o1poM=
X-Received: by 2002:aca:4d58:: with SMTP id a85mr6927396oib.110.1600021417146; 
 Sun, 13 Sep 2020 11:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <alpine.DEB.2.21.2009110925160.9220@felia>
 <CABJPP5AWNpYyx5asMNZccqbq07ZW+pH+EwJ+KTZ+SSOAnWZwVQ@mail.gmail.com>
 <alpine.DEB.2.21.2009121252280.13082@felia>
 <CABJPP5DMF9OpZR0agobunb3i3hLGkqedbeL-YohNn0X6Juk64w@mail.gmail.com>
 <alpine.DEB.2.21.2009121419430.3770@felia>
 <CABJPP5BFNjBhdcvBWqDYnR-o2sZ0oY77bYr9PxducXW4Y=482Q@mail.gmail.com>
 <alpine.DEB.2.21.2009131301570.22585@felia>
 <CABJPP5BmRcC+OTSjuX_QrYononVq__DkhjGOgiKrP147MAXK+g@mail.gmail.com>
 <alpine.DEB.2.21.2009132015570.6806@felia>
In-Reply-To: <alpine.DEB.2.21.2009132015570.6806@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 13 Sep 2020 23:53:25 +0530
Message-ID: <CABJPP5AgSv92Du1n4Xax=X01RAD627jRrwydVMiO89stZ2reMA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Linux kernel checkpatch.pl mentorship
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
Content-Type: multipart/mixed; boundary="===============2944553585445353946=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2944553585445353946==
Content-Type: multipart/alternative; boundary="00000000000033bf2a05af3604e2"

--00000000000033bf2a05af3604e2
Content-Type: text/plain; charset="UTF-8"

I missed to CC linux kernel mentees list in my previous mail. The contents
follow:

Posting the abbrev. commit hashes for the changed cases:

> Can you share the errors that have changed after the patch was applied?
>
> - Which two cases of COMMIT_LOG_LONG_LINE have disappeared?

The following commits have disappeared which earlier had a
COMMIT_LOG_LONG_LINE warning:
4714d13791f8
6536993371fa

> - Which cases of GIT_COMMIT_ID have disappeared?

The following commits which threw GIT_COMMIT_ID have disappeared:
0b987032f8b5
4557ac6b344b
ad0f75e5f57c
c3dbe541ef77
da785a87787c
e575fb9e76c8
0b22c25e1b81
ba8c90c61847
0ae705f3d2b2
490705888107
0828137e8f16
e9e81b634303
e9e4ef9116b1
68cda40d9f3c
1ca0c2f61211
6f8b12d661d0
97a37c919f62

> - Which cases of GIT_COMMIT_ID are new?

Only one case is new:
ebf57440ec59

> - Which cases of GIT_COMMIT_ID have changed?

As there can be multiple GIT_COMMIT_ID errors per commit hash processed, I
am
giving the change in occurrence per commit hash:

e9e4ef9116b1: 1-> 0
490705888107: 1-> 0
ba8c90c61847: 1-> 0
97a37c919f62: 1-> 0
e9e81b634303: 1-> 0
0828137e8f16: 1-> 0
5fdbe136ae19: 2-> 3
0b22c25e1b81: 1-> 0
e575fb9e76c8: 1-> 0
c3dbe541ef77: 1-> 0
ad0f75e5f57c: 1-> 0
e0a851fe6b9b: 2-> 1
0ae705f3d2b2: 1-> 0
064c73afe738: 3-> 2
4557ac6b344b: 1-> 0
6f8b12d661d0: 1-> 0
da785a87787c: 1-> 0
68cda40d9f3c: 1-> 0
1ca0c2f61211: 1-> 0
bcf41dc480b1: 4-> 2
0b987032f8b5: 1-> 0
ebf57440ec59: 0-> 1

The aggregation of the occurences will tell you that there has been a net
decrease of 19
GIT_COMMIT_ID errors.

Thanks,
Dwaipayan

--00000000000033bf2a05af3604e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>I missed to CC linux kernel mentees list in my previou=
s mail. The contents follow:<div><br></div><div>Posting the abbrev. commit =
hashes for the changed cases:</div><div><br></div><div><font color=3D"#741b=
47">&gt; Can you share the errors that have changed after the patch was app=
lied?<br>&gt;<br>&gt; - Which two cases of COMMIT_LOG_LONG_LINE have disapp=
eared?<br></font><br>The following commits have disappeared which earlier h=
ad a COMMIT_LOG_LONG_LINE warning:<br>4714d13791f8<br>6536993371fa<br><br><=
font color=3D"#741b47">&gt; - Which cases of GIT_COMMIT_ID have disappeared=
?</font><br><br>The following commits which threw GIT_COMMIT_ID have disapp=
eared:<br>0b987032f8b5<br>4557ac6b344b<br>ad0f75e5f57c<br>c3dbe541ef77<br>d=
a785a87787c<br>e575fb9e76c8<br>0b22c25e1b81<br>ba8c90c61847<br>0ae705f3d2b2=
<br>490705888107<br>0828137e8f16<br>e9e81b634303<br>e9e4ef9116b1<br>68cda40=
d9f3c<br>1ca0c2f61211<br>6f8b12d661d0<br>97a37c919f62<br><br><font color=3D=
"#741b47">&gt; - Which cases of GIT_COMMIT_ID are new?</font><br><br>Only o=
ne case is new:<br>ebf57440ec59<br><br><font color=3D"#741b47">&gt; - Which=
 cases of GIT_COMMIT_ID have changed?</font><br><br>As there can be multipl=
e GIT_COMMIT_ID errors per commit hash processed, I am <br>giving the chang=
e in occurrence per commit hash:<br><br>e9e4ef9116b1: 1-&gt; 0<br>490705888=
107: 1-&gt; 0<br>ba8c90c61847: 1-&gt; 0<br>97a37c919f62: 1-&gt; 0<br>e9e81b=
634303: 1-&gt; 0<br>0828137e8f16: 1-&gt; 0<br>5fdbe136ae19: 2-&gt; 3<br>0b2=
2c25e1b81: 1-&gt; 0<br>e575fb9e76c8: 1-&gt; 0<br>c3dbe541ef77: 1-&gt; 0<br>=
ad0f75e5f57c: 1-&gt; 0<br>e0a851fe6b9b: 2-&gt; 1<br>0ae705f3d2b2: 1-&gt; 0<=
br>064c73afe738: 3-&gt; 2<br>4557ac6b344b: 1-&gt; 0<br>6f8b12d661d0: 1-&gt;=
 0<br>da785a87787c: 1-&gt; 0<br>68cda40d9f3c: 1-&gt; 0<br>1ca0c2f61211: 1-&=
gt; 0<br>bcf41dc480b1: 4-&gt; 2<br>0b987032f8b5: 1-&gt; 0<br>ebf57440ec59: =
0-&gt; 1<br><br>The aggregation of the occurences will tell you that there =
has been a net decrease of 19 <br>GIT_COMMIT_ID errors.<br><br>Thanks,<br>D=
waipayan<br></div></div>

--00000000000033bf2a05af3604e2--

--===============2944553585445353946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2944553585445353946==--
