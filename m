Return-Path: <SRS0=Gcau=G2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C79C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jan 2021 12:46:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B47EC22C7C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jan 2021 12:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B47EC22C7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 39EF9873A1;
	Sat, 23 Jan 2021 12:46:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ScRCCshM5OjK; Sat, 23 Jan 2021 12:46:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 545F68737B;
	Sat, 23 Jan 2021 12:46:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30B37C08A1;
	Sat, 23 Jan 2021 12:46:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0440CC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 12:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C25EE2037A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 12:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqExEs+hC9m8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 12:46:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by silver.osuosl.org (Postfix) with ESMTPS id B03A720013
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 12:46:00 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id u17so17001658iow.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 04:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fyvowrwmj9MsUNN70Gn4y/ZdPpJRvX+3QkfhtF2gcYE=;
 b=BMOZRzMRQAban20TgtL+7MWknNdl28qFQuzSeZZes4P+fBnpK4lVzNG7Cjq2w1kKvu
 RdsTuSYJCbkT12jdsKHLvZTP9J23o+nBfFjC1Ism6ZN6n5FL0ibr1k1Lf6dEciQTtAIo
 O3wMtdPgk8/sslwTnZ3IxfLeldhj2ifbQ6yyVrNPoVn7qatEtAr2hrip2EBbY6cDLYIw
 Wq1a3cKd3j5Ea93q58KJXKK7QLJY36sMGAEGiHDyuww1oWsqYTJnaJXpUH50GFVRmjV7
 iNxkMiexoKfjQgfwsw0l/bqG9q6i/xGhFY3+Zwaa76krRNfxid09ZaNw4gIwWBc/9aUf
 rEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fyvowrwmj9MsUNN70Gn4y/ZdPpJRvX+3QkfhtF2gcYE=;
 b=fGmiqlZ8HCpk9l1tf2PMHILtX0nKKn2xGt6DNs1WIWFtsM/2GCD+6gYenz6BXztSbM
 8F3hX7295yUYb9D/l7P3bEW2MD75eH54pEhGN6NHvcTuZUqLDUfNOAvK+AaGvuhIVE0C
 ImK/B7hejtQIzXrwKVShNv+dzmm/aOJmdijuBwQwW36dPAzy5bUFBeOG3NOMOu/K/KSr
 01hltwt82sJ2qbGGO9A5mh6U9RDU7Q7Wc/A6YJ97DmiqipkL8uu7sI5n96L6qaN3yoxa
 j27UhutYUoKvZ7OIAdXXjiSehIP6aM8YKMnzHbTyK3sWTAW53NC7EeFF3FGmncKDS3i3
 4iSA==
X-Gm-Message-State: AOAM532ETH4c65ZW0U9WqgpHAc84RIDVTYO5Nl1BTfS/BgoetsRGnP/P
 yyc0NOaNPUhZ5qLVQAfCzbUFCDURrawauM7SAb0=
X-Google-Smtp-Source: ABdhPJwQ+s3uxXeRWt1D4WlPCljX4/PvYAQLBtOzQoSSeWkxMFBYlgf+JkJt+MrsV0Xt/Vb4NcoLLGzjhsek0HjQgaY=
X-Received: by 2002:a05:6e02:1aa8:: with SMTP id
 l8mr84231ilv.251.1611405959979; 
 Sat, 23 Jan 2021 04:45:59 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5DZH0=kr6JaE0wv4iC+pq-9YG=SLPE_15jiQ1YnW1_1rg@mail.gmail.com>
 <CAKXUXMz06TQmbeeugD0F0n6+ESYM6bNOi2oVw4Q7d_8qBh3D+w@mail.gmail.com>
 <CABJPP5BXmrpc=q3t3_K1zwBjhSAfOMd=4OOQ1t-wfxP53RR1Mg@mail.gmail.com>
In-Reply-To: <CABJPP5BXmrpc=q3t3_K1zwBjhSAfOMd=4OOQ1t-wfxP53RR1Mg@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 23 Jan 2021 13:45:50 +0100
Message-ID: <CAKXUXMy532KTuzfE09dJ_Yi4JUV3ZR5cyj-zapkaysFtgN=saw@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Addition of verbose mode to checkpatch
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
Content-Type: multipart/mixed; boundary="===============3737310766658009978=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3737310766658009978==
Content-Type: multipart/alternative; boundary="000000000000d5657c05b990affc"

--000000000000d5657c05b990affc
Content-Type: text/plain; charset="UTF-8"

Sounds good to me.

Dwaipayan Ray <dwaipayanray1@gmail.com> schrieb am Sa., 23. Jan. 2021,
11:12:

> On Sat, Jan 23, 2021 at 8:44 AM Lukas Bulwahn <lukas.bulwahn@gmail.com>
> wrote:
> >
> > On Fri, Jan 22, 2021 at 10:27 PM Dwaipayan Ray <dwaipayanray1@gmail.com>
> wrote:
> > >
> > > Hi Lukas and all,
> > > Recently while going through the warnings emitted by checkpatch,
> > > the necessity of a verbose mode came up once again. Joe had
> > > already suggested that a verbose mode would probably be worked
> > > on.
> > >
> > > As for how that could be done, that leaves us at a couple of options.
> > > Since writing verbose messages for all warnings aren't possible at
> once,
> > > there can be an optional extension when emitting messages:
> > >
> > > Currently, a warning can be emitted by
> > > WARN("TYPE", "Message")
> > > which could be converted to say:
> > > WARN('TYPE", "Message", "Verbose")
> > >
> > > Another way is to leave the original warning emitting syntax intact
> > > and instead go for a dictionary for verbose messages:
> > > our %dict = (
> > > "TYPE1" => "Verbose",
> > > "TYPE2" => "Verbose"
> > > ...);
> > >
> > > Although this leaves us the ability to customize the verbose output
> > > for each warning of a particular type.
> > >
> > > Which do you think would be best? Certainly more options might be
> > > possible, so any new inputs will be nice as well!
> > >
> >
> > I think any of the two approaches would work.
> >
> > But how about a completely different approach?
> >
> > The verbose message is really an explanation of why kernel developers
> > think this rule should be followed (what is the history, what does it
> > try to warn about, what are possible fixes, what are accepted
> > deviations, ...).
> >
> > So, this should not be placed into the checkpatch.pl script itself,
> > but into Documentation.
> >
> > checkpatch.pl would simply quickly parse the Documentation and present
> > the content for the specific rules that were violated.
> >
> > Let's say this Documentation is in
> > ./Documentation/tools/checkpatch.rst, and they contain subsections
> > with labels/name with the TYPE identifier. Then when a warning of TYPE
> > is relevant for a specific patch, you print the description from that
> > one subsection.
> >
> > In checkpatch itself, you would only need a very generic mechanism then.
> >
>
> That sounds great to me!
> Even I had it in mind but thought maybe checkpatch could be less
> reliant on other
> files. But this also solves our purpose for an external documentation
> for checkpatch
> rules, so its a kinda win win situation.
>
> I think maybe we will need a special structure for the documentation file
> itself
> but its certainly doable.
>
> Do you think I should go on to propose this idea to Joe now?
>
> Thanks,
> Dwaipayan.
>

--000000000000d5657c05b990affc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Sounds good to me.=C2=A0</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">Dwaipayan Ray &lt;<a href=3D"mail=
to:dwaipayanray1@gmail.com">dwaipayanray1@gmail.com</a>&gt; schrieb am Sa.,=
 23. Jan. 2021, 11:12:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sat, Jan =
23, 2021 at 8:44 AM Lukas Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">lukas.bulwahn@gmail.com</a>&gt; =
wrote:<br>
&gt;<br>
&gt; On Fri, Jan 22, 2021 at 10:27 PM Dwaipayan Ray &lt;<a href=3D"mailto:d=
waipayanray1@gmail.com" target=3D"_blank" rel=3D"noreferrer">dwaipayanray1@=
gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Lukas and all,<br>
&gt; &gt; Recently while going through the warnings emitted by checkpatch,<=
br>
&gt; &gt; the necessity of a verbose mode came up once again. Joe had<br>
&gt; &gt; already suggested that a verbose mode would probably be worked<br=
>
&gt; &gt; on.<br>
&gt; &gt;<br>
&gt; &gt; As for how that could be done, that leaves us at a couple of opti=
ons.<br>
&gt; &gt; Since writing verbose messages for all warnings aren&#39;t possib=
le at once,<br>
&gt; &gt; there can be an optional extension when emitting messages:<br>
&gt; &gt;<br>
&gt; &gt; Currently, a warning can be emitted by<br>
&gt; &gt; WARN(&quot;TYPE&quot;, &quot;Message&quot;)<br>
&gt; &gt; which could be converted to say:<br>
&gt; &gt; WARN(&#39;TYPE&quot;, &quot;Message&quot;, &quot;Verbose&quot;)<b=
r>
&gt; &gt;<br>
&gt; &gt; Another way is to leave the original warning emitting syntax inta=
ct<br>
&gt; &gt; and instead go for a dictionary for verbose messages:<br>
&gt; &gt; our %dict =3D (<br>
&gt; &gt; &quot;TYPE1&quot; =3D&gt; &quot;Verbose&quot;,<br>
&gt; &gt; &quot;TYPE2&quot; =3D&gt; &quot;Verbose&quot;<br>
&gt; &gt; ...);<br>
&gt; &gt;<br>
&gt; &gt; Although this leaves us the ability to customize the verbose outp=
ut<br>
&gt; &gt; for each warning of a particular type.<br>
&gt; &gt;<br>
&gt; &gt; Which do you think would be best? Certainly more options might be=
<br>
&gt; &gt; possible, so any new inputs will be nice as well!<br>
&gt; &gt;<br>
&gt;<br>
&gt; I think any of the two approaches would work.<br>
&gt;<br>
&gt; But how about a completely different approach?<br>
&gt;<br>
&gt; The verbose message is really an explanation of why kernel developers<=
br>
&gt; think this rule should be followed (what is the history, what does it<=
br>
&gt; try to warn about, what are possible fixes, what are accepted<br>
&gt; deviations, ...).<br>
&gt;<br>
&gt; So, this should not be placed into the <a href=3D"http://checkpatch.pl=
" rel=3D"noreferrer noreferrer" target=3D"_blank">checkpatch.pl</a> script =
itself,<br>
&gt; but into Documentation.<br>
&gt;<br>
&gt; <a href=3D"http://checkpatch.pl" rel=3D"noreferrer noreferrer" target=
=3D"_blank">checkpatch.pl</a> would simply quickly parse the Documentation =
and present<br>
&gt; the content for the specific rules that were violated.<br>
&gt;<br>
&gt; Let&#39;s say this Documentation is in<br>
&gt; ./Documentation/tools/checkpatch.rst, and they contain subsections<br>
&gt; with labels/name with the TYPE identifier. Then when a warning of TYPE=
<br>
&gt; is relevant for a specific patch, you print the description from that<=
br>
&gt; one subsection.<br>
&gt;<br>
&gt; In checkpatch itself, you would only need a very generic mechanism the=
n.<br>
&gt;<br>
<br>
That sounds great to me!<br>
Even I had it in mind but thought maybe checkpatch could be less<br>
reliant on other<br>
files. But this also solves our purpose for an external documentation<br>
for checkpatch<br>
rules, so its a kinda win win situation.<br>
<br>
I think maybe we will need a special structure for the documentation file i=
tself<br>
but its certainly doable.<br>
<br>
Do you think I should go on to propose this idea to Joe now?<br>
<br>
Thanks,<br>
Dwaipayan.<br>
</blockquote></div>

--000000000000d5657c05b990affc--

--===============3737310766658009978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3737310766658009978==--
