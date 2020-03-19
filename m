Return-Path: <SRS0=BDZW=5E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C414EC4332B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Mar 2020 16:27:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9292E2072C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Mar 2020 16:27:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZ09OgBi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9292E2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5AB7A87EE6;
	Thu, 19 Mar 2020 16:27:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L5jfSAIn8TjO; Thu, 19 Mar 2020 16:27:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3BDF187ED6;
	Thu, 19 Mar 2020 16:27:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B3DAC1830;
	Thu, 19 Mar 2020 16:27:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8DF5DC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Mar 2020 16:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7B3F0204F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Mar 2020 16:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PTX97B5Yb8b9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Mar 2020 16:27:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 697F42045C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Mar 2020 16:27:01 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id f8so1263624plt.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Mar 2020 09:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=ea9zuAkLk4+6JCCbykpY0++02KarRdu8yZ7pu1fLyZE=;
 b=iZ09OgBiv+XE9Ufxw+DNQjupiKyIfnNrXYzTvR0DB4CQm3DZmKvF2w0Gk5nJsUq7HK
 cCuK5lIOHDSgXdtGQIfNJaGcYDHP5ZX9JmiEeNzrXEuyy9apGF22c553OWrOQB4CSMkx
 lueLAlhq8r5Qm1OvGoufKIoF41jOulEAdzeYyFKaGLH/aAisMgZX5PEWJE/NVNJy+CIG
 Cl4nqa2PfDEAbpPBj5hpbMNY8ysVEoklzFMuF3pKRlrQNpUQzuz7CGdNm8tOWFKtpYXw
 Gos2mfLpdVBp1U5hE4ybZRQSaZWI2ACPs4Yc0A/tolKniUVoO4mkIvHNtURzAjvvRX3e
 LTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ea9zuAkLk4+6JCCbykpY0++02KarRdu8yZ7pu1fLyZE=;
 b=XfcFhGvZJoa9RuJbQ6LWZflDiXqiBzhwJs+6Nxt8en8hvetMo+RVzksSjkNFkhtPH7
 VPtiOWvZTGJw+NdmGnut9k7+yJ0zZXPLc9WMhrZNymB9+MUzq3JWDDjGeZRNdr4GXbb4
 RE/qWsaddYUToD+8h2ZO4pixOB65ro7lDptVdi1syWD98nCovT0VpkDvq75yLFQeeAyF
 Tcssc2Sp5V67GSKaS5tqlS5FjzUIF57JfpBPW55nA+u651LicpVzSceGWME2NT9SEzKv
 MaGQAnacmM/RabwozViIhIvkjMLOwd26J4t4HAhvgnA0g3gVS20RI0QzI/9J43GF+2FN
 A5Pw==
X-Gm-Message-State: ANhLgQ3edHwHP03D+q4aY46DVNnvtrLaX0e6XycPh4Hd4VWsVBUeLMbV
 lKdLLETNtGTLoryWBnCvCpk=
X-Google-Smtp-Source: ADFU+vut9FJmuOcH4LRH0Eo4sy2PSiNLwIhrgeTDMj6gtB3kgkb4S9/WWbAzm/R2xYxw/xD+KaqPgw==
X-Received: by 2002:a17:902:8308:: with SMTP id
 bd8mr4368922plb.210.1584635220779; 
 Thu, 19 Mar 2020 09:27:00 -0700 (PDT)
Received: from localhost.localdomain ([1.38.148.71])
 by smtp.gmail.com with ESMTPSA id m11sm2427695pjq.13.2020.03.19.09.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 09:27:00 -0700 (PDT)
Message-ID: <df62e9904a7864ddd3a55fc1ab7866bb28631fd6.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
Date: Thu, 19 Mar 2020 21:56:50 +0530
In-Reply-To: <d52cb8eef0adb9db2103749a14eee184a2b65102.camel@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
 <20200316100319.27935-2-jaskaransingh7654321@gmail.com>
 <alpine.DEB.2.21.2003181823000.2979@hadrien>
 <a703037e9791b58252c16d27e1a41707aea273b7.camel@gmail.com>
 <alpine.DEB.2.21.2003191654150.2312@hadrien>
 <d52cb8eef0adb9db2103749a14eee184a2b65102.camel@gmail.com>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: Julia Lawall <julia.lawall@inria.fr>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [PATCH 01/26] parsing_cocci: Add
	Function Prototype token
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, 2020-03-19 at 21:55 +0530, Jaskaran Singh wrote:
> On Thu, 2020-03-19 at 16:54 +0100, Julia Lawall wrote:
> > On Thu, 19 Mar 2020, Jaskaran Singh wrote:
> > 
> > > On Wed, 2020-03-18 at 18:25 +0100, Julia Lawall wrote:
> > > > On Mon, 16 Mar 2020, Jaskaran Singh wrote:
> > > > 
> > > > > To add the types ParenType and FunctionType to the SmPL AST,
> > > > > a
> > > > > reduce/reduce conflict with the funproto rule of the SmPL
> > > > > parser
> > > > > must be resolved. This requires explicitly identifying a
> > > > > function
> > > > > prototype by use of a token (TFunProto).
> > > > > 
> > > > > While the correct method of identifying a function prototype
> > > > > would
> > > > > be to
> > > > > check if an identifier is preceded by a return type, it is
> > > > > challenging
> > > > > to implement. This is because implementing an OCaml function,
> > > > > to
> > > > > correctly determine a C type in SmPL, without the aid of
> > > > > Yacc,
> > > > > would
> > > > > have to handle a number of cases (disjunctions, typeof
> > > > > expressions,
> > > > > etc.).
> > > > > 
> > > > > Thus, a slightly hacky approach is taken to determine a
> > > > > function
> > > > > prototype with not the best certainty but what works for most
> > > > > cases
> > > > > in SmPL. If the identifier is preceded by any token that does
> > > > > not
> > > > > seem to be part of a type, then it is not identified as a
> > > > > function
> > > > > prototype. Else, it is.
> > > > 
> > > > This sacrifices the test case tests/p1p2.cocci:
> > > > 
> > > 
> > > What do you mean by sacrifice?
> > 
> > That it doesn't work after applying 01.
> > 
> > Does something that comes later make it work again?
> > 
> 
> Yes. I applied the series till 16/25 


Correction: 16/26*

Cheers,
Jaskaran.

> (Got a fatal error before that),
> where the test worked again.
> 
> Cheers,
> Jaskaran.
> 
> > julia
> > 
> > > The test case seems to work, but not with just 01 applied. Here's
> > > what
> > > the debugger tells me about the AST:
> > > 
> > > Ast_cocci.FunProto
> > > ([Ast_cocci.FType
> > >    {Ast_cocci.node =
> > >      Ast_cocci.Type (false, None,
> > >       {Ast_cocci.node =
> > >         Ast_cocci.MetaType
> > >          ((("rule starting on line 11", "T"),
> > >            {Ast_cocci.line = 18; column = 1;
> > >             strbef = []; straft = [];
> > >             whitespace = " "},
> > >            Ast_cocci.CONTEXT (Ast_cocci.NoPos,
> > >             Ast_cocci.AFTER
> > >              ([[Ast_cocci.Directive
> > >                  [Ast_cocci.Space
> > >                    "__attribute__((nonnull(2)))"]]],
> > >              Ast_cocci.ONE)),
> > >            []),
> > > 
> > > Maybe after the grammar changes, Menhir does some kind of
> > > lookahead?
> > > I'm not sure.
> > > 
> > > Cheers,
> > > Jaskaran.
> > > 
> > > > @@
> > > > typedef Error;
> > > > type T;
> > > > identifier FN;
> > > > parameter P1;
> > > > @@
> > > >  T
> > > > +__attribute__((nonnull(1)))
> > > >  FN(P1, Error **errp);
> > > > 
> > > > @@
> > > > typedef Error;
> > > > type T;
> > > > identifier FN;
> > > > parameter P1;
> > > > parameter P2;
> > > > @@
> > > >  T
> > > > +__attribute__((nonnull(2)))
> > > >  FN(P1, P2, Error **errp);
> > > > 
> > > > Normally, the only way that you can have a ) before a function
> > > > call
> > > > is
> > > > when there is a cast.  But hopefully in that case there would
> > > > not
> > > > be
> > > > two
> > > > )) before the function call.  Can that get around the problem?
> > > > 
> > > > julia
> > > > 
> > > > 
> > > > 
> > > > 
> > > > > Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com
> > > > > >
> > > > > ---
> > > > >  parsing_cocci/parse_cocci.ml          | 72
> > > > > +++++++++++++++++++++++----
> > > > >  parsing_cocci/parser_cocci_menhir.mly |  9 ++--
> > > > >  2 files changed, 67 insertions(+), 14 deletions(-)
> > > > > 
> > > > > diff --git a/parsing_cocci/parse_cocci.ml
> > > > > b/parsing_cocci/parse_cocci.ml
> > > > > index 679d213a..4b2cb7e4 100644
> > > > > --- a/parsing_cocci/parse_cocci.ml
> > > > > +++ b/parsing_cocci/parse_cocci.ml
> > > > > @@ -295,6 +295,7 @@ let token2c (tok,_) add_clt =
> > > > >    | PC.TLineEnd(clt) -> "line end"
> > > > >    | PC.TInvalid -> "invalid"
> > > > >    | PC.TFunDecl(clt) -> "fundecl"
> > > > > +  | PC.TFunProto(clt) -> "funproto"
> > > > > 
> > > > >    | PC.TIso -> "<=>"
> > > > >    | PC.TRightIso -> "=>"
> > > > > @@ -480,7 +481,7 @@ let get_clt (tok,_) =
> > > > > 
> > > > >    | PC.TOPar0(_,clt) | PC.TMid0(_,clt) | PC.TAnd0(_,clt) |
> > > > > PC.TCPar0(_,clt)
> > > > >    | PC.TOEllipsis(clt) | PC.TCEllipsis(clt)
> > > > > -  | PC.TPOEllipsis(clt) | PC.TPCEllipsis(clt)
> > > > > +  | PC.TPOEllipsis(clt) | PC.TPCEllipsis(clt) |
> > > > > PC.TFunProto(clt)
> > > > >    | PC.TFunDecl(clt) | PC.TDirective(_,clt) | PC.TAttr_(clt)
> > > > >    | PC.TLineEnd(clt) -> clt
> > > > >    | PC.TVAEllipsis(clt) -> clt
> > > > > @@ -718,6 +719,7 @@ let update_clt (tok,x) clt =
> > > > > 
> > > > >    | PC.TLineEnd(_) -> (PC.TLineEnd(clt),x)
> > > > >    | PC.TFunDecl(_) -> (PC.TFunDecl(clt),x)
> > > > > +  | PC.TFunProto(_) -> (PC.TFunProto(clt),x)
> > > > >    | PC.TTildeExclEq(_) -> (PC.TTildeExclEq(clt),x)
> > > > >    | PC.TDirective(a,_) -> (PC.TDirective(a,clt),x)
> > > > >    | PC.TAttr_(_) -> (PC.TAttr_(clt),x)
> > > > > @@ -925,7 +927,7 @@ let split_token ((tok,_) as t) =
> > > > >    | PC.TInitialize | PC.TFinalize -> ([t],[t])
> > > > >    | PC.TPArob clt | PC.TMetaPos(_,_,_,clt) |
> > > > > PC.TMetaCom(_,_,clt)
> > > > > -> split t clt
> > > > > 
> > > > > -  | PC.TFunDecl(clt)
> > > > > +  | PC.TFunDecl(clt) | PC.TFunProto(clt)
> > > > >    | PC.TWhen(clt) | PC.TWhenTrue(clt) | PC.TWhenFalse(clt)
> > > > >    | PC.TAny(clt) | PC.TStrict(clt) | PC.TLineEnd(clt)
> > > > >    | PC.TEllipsis(clt)
> > > > > @@ -1006,7 +1008,8 @@ let find_function_names l =
> > > > >      | _ -> false in
> > > > >    let rec split acc = function
> > > > >        [] | [_] -> raise Irrelevant
> > > > > -    | ((PC.TCPar(_),_) as t1) :: ((PC.TOBrace(_),_) as t2)
> > > > > ::
> > > > > rest
> > > > > ->
> > > > > +    | ((PC.TCPar(_),_) as t1) :: ((PC.TOBrace(_),_) as t2)
> > > > > ::
> > > > > rest
> > > > > +    | ((PC.TCPar(_),_) as t1) :: ((PC.TPtVirg(_),_) as t2)
> > > > > ::
> > > > > rest
> > > > > ->
> > > > >  	(List.rev (t1::acc),(t2::rest))
> > > > >      | x::xs -> split (x::acc) xs in
> > > > >    let rec balanced_name level = function
> > > > > @@ -1037,7 +1040,48 @@ let find_function_names l =
> > > > >      | (PC.TArobArob,_)::_ | (PC.TArob,_)::_ | (PC.EOF,_)::_
> > > > > ->
> > > > >  	raise Irrelevant
> > > > >      | t::rest -> balanced_args level rest in
> > > > > -  let rec loop = function
> > > > > +  let rec is_permissible_proto = function
> > > > > +      [] -> false
> > > > > +    | (PC.TCPar0(_),_)::
> > > > > +      ((PC.TMid0(_),_) | (PC.TAnd0(_),_))::
> > > > > +      (PC.TOPar0(_),_)::_ -> false
> > > > > +    | (PC.TOPar0(_),_)::rest
> > > > > +    | (PC.TCPar0(_),_)::rest -> is_permissible_proto rest
> > > > > +    | x::rest when is_mid x ->
> > > > > +        let rec loop = function
> > > > > +          [] -> false
> > > > > +        | (PC.TOPar0(_),_)::xs -> is_permissible_proto xs
> > > > > +        | x::xs -> loop xs in
> > > > > +        loop rest
> > > > > +    | _::((PC.TEq(_),_) |
> > > > > (PC.TNotEq(_),_))::(PC.TWhen(_),_)::_
> > > > > +    | _::(PC.TWhen(_),_)::_
> > > > > +    | (PC.TComma(_),_)::_
> > > > > +    | (PC.TDirective(_),_)::_
> > > > > +    | (PC.TElse(_),_)::_
> > > > > +    | (PC.TReturn(_),_)::_
> > > > > +    | (PC.TMetaStm(_),_)::_
> > > > > +    | (PC.TMetaExp(_),_)::_
> > > > > +    | (PC.TMetaId(_),_)::_
> > > > > +    | (PC.TMetaLocalIdExp(_),_)::_
> > > > > +    | (PC.TEq(_),_)::_
> > > > > +    | (PC.TEllipsis(_),_)::_
> > > > > +    | (PC.TOEllipsis(_),_)::_
> > > > > +    | (PC.TCEllipsis(_),_)::_
> > > > > +    | (PC.TPOEllipsis(_),_)::_
> > > > > +    | (PC.TPCEllipsis(_),_)::_
> > > > > +    | (PC.TPtVirg(_),_)::_
> > > > > +    | (PC.TOBrace(_),_)::_
> > > > > +    | (PC.TCBrace(_),_)::_
> > > > > +    | (PC.TOPar(_),_)::_
> > > > > +    | (PC.TCPar(_),_)::_
> > > > > +    | (PC.TIdent(_),_)::_ -> false
> > > > > +    | _ -> true in
> > > > > +  let decl_or_proto clt info bef aft =
> > > > > +    match aft with
> > > > > +      (PC.TOBrace(_),_)::_ -> (((PC.TFunDecl(clt),info) ::
> > > > > bef),
> > > > > aft)
> > > > > +    | (PC.TPtVirg(_),_)::_ -> (((PC.TFunProto(clt),info) ::
> > > > > bef),
> > > > > aft)
> > > > > +    | _ -> raise Irrelevant in
> > > > > +  let rec loop acc = function
> > > > >        [] -> []
> > > > >      | t :: rest ->
> > > > >  	if is_par t || is_mid t || is_ident t
> > > > > @@ -1046,26 +1090,30 @@ let find_function_names l =
> > > > >  	    try
> > > > >  	      let (bef,aft) = split [] (t::rest) in
> > > > >  	      let rest = balanced_name 0 bef in
> > > > > +              (match aft with
> > > > > +                (PC.TPtVirg(_),_)::_
> > > > > +                 when not(is_permissible_proto acc) -> raise
> > > > > Irrelevant
> > > > > +              | _ ->
> > > > >  	      (match rest with
> > > > >  		(PC.TOPar(_),_)::_ ->
> > > > >  		  (match balanced_args 0 rest with
> > > > >  		    [] ->
> > > > >  		      let (_,info) as h = List.hd bef in
> > > > >  		      let clt = get_clt h in
> > > > > -		      (((PC.TFunDecl(clt),info) :: bef), aft)
> > > > > +                      decl_or_proto clt info bef aft
> > > > >  		  | (PC.TAttr_(_),_)::rest ->
> > > > >  		      (match balanced_args 0 rest with
> > > > >  			[] ->
> > > > >  			  let (_,info) as h = List.hd bef in
> > > > >  			  let clt = get_clt h in
> > > > > -			  (((PC.TFunDecl(clt),info) :: bef),
> > > > > aft)
> > > > > +                          decl_or_proto clt info bef aft
> > > > >  		      | _ -> raise Irrelevant)
> > > > >  		  | _ -> raise Irrelevant)
> > > > > -	      | _ -> raise Irrelevant)
> > > > > +	      | _ -> raise Irrelevant))
> > > > >  	    with Irrelevant -> ([t],rest) in
> > > > > -	  t @ (loop rest)
> > > > > -	else t :: (loop rest) in
> > > > > -  loop l
> > > > > +          t @ (loop (t @ acc) rest)
> > > > > +        else t :: (loop (t :: acc) rest) in
> > > > > +  loop [] l
> > > > > 
> > > > >  (* ---------------------------------------------------------
> > > > > ----
> > > > > ---------- *)
> > > > >  (* an attribute is an identifier that precedes another
> > > > > identifier
> > > > > and
> > > > > @@ -1168,6 +1216,8 @@ let detect_types in_meta_decls l =
> > > > >  	delim::newid::id::(loop false infn (ident::type_names)
> > > > > rest)
> > > > >      | ((PC.TFunDecl(_),_) as fn)::rest ->
> > > > >  	fn::(loop false 1 type_names rest)
> > > > > +    | ((PC.TFunProto(_),_) as fn)::rest ->
> > > > > +	fn::(loop false 1 type_names rest)
> > > > >      | ((PC.TOPar(_),_) as lp)::rest when infn > 0 ->
> > > > >  	lp::(loop false (infn + 1) type_names rest)
> > > > >      | ((PC.TCPar(_),_) as rp)::rest when infn > 0 ->
> > > > > @@ -1252,7 +1302,7 @@ let token2line (tok,_) =
> > > > >    | PC.TMetaDParamList(_,_,_,_,clt) |
> > > > > PC.TMetaFunc(_,_,_,clt)
> > > > >    | PC.TMetaLocalFunc(_,_,_,clt) | PC.TMetaPos(_,_,_,clt) |
> > > > > PC.TMetaCom(_,_,clt)
> > > > > 
> > > > > -  | PC.TFunDecl(clt)
> > > > > +  | PC.TFunDecl(clt) | PC.TFunProto(clt)
> > > > >    | PC.TWhen(clt) | PC.TWhenTrue(clt) | PC.TWhenFalse(clt)
> > > > >    | PC.TAny(clt) | PC.TStrict(clt) | PC.TEllipsis(clt)
> > > > > 
> > > > > diff --git a/parsing_cocci/parser_cocci_menhir.mly
> > > > > b/parsing_cocci/parser_cocci_menhir.mly
> > > > > index 9e6c8a08..26958f63 100644
> > > > > --- a/parsing_cocci/parser_cocci_menhir.mly
> > > > > +++ b/parsing_cocci/parser_cocci_menhir.mly
> > > > > @@ -239,7 +239,8 @@ let inline_id aft = function
> > > > > 
> > > > >  %token <Data.clt> TVAEllipsis
> > > > >  %token <Data.clt> TIf TElse TWhile TFor TDo TSwitch TCase
> > > > > TDefault
> > > > > TReturn
> > > > > -%token <Data.clt> TBreak TContinue TGoto TSizeof TTypeof
> > > > > TFunDecl
> > > > > Tdecimal Texec
> > > > > +%token <Data.clt> TBreak TContinue TGoto TSizeof TTypeof
> > > > > TFunDecl
> > > > > TFunProto
> > > > > +%token <Data.clt> Tdecimal Texec
> > > > >  %token <string * Data.clt> TIdent TTypeId TDeclarerId
> > > > > TIteratorId
> > > > > TSymId
> > > > >  %token <Ast_cocci.added_string * Data.clt> TDirective
> > > > >  %token <Data.clt> TAttr_
> > > > > @@ -1439,7 +1440,8 @@
> > > > > reverse_separated_nonempty_llist(separator,
> > > > > X):
> > > > > 
> > > > >  funproto:
> > > > >    s=ioption(storage) i=ioption(Tinline) t=ctype
> > > > > -  id=fn_ident lp=TOPar arglist=arg_list(name_opt_decl)
> > > > > rp=TCPar
> > > > > pt=TPtVirg
> > > > > +  TFunProto id=fn_ident
> > > > > +  lp=TOPar arglist=arg_list(name_opt_decl) rp=TCPar
> > > > > pt=TPtVirg
> > > > >        { let s = match s with None -> [] | Some s ->
> > > > > [Ast0.FStorage
> > > > > s] in
> > > > >          let i =
> > > > >  	  match i with
> > > > > @@ -1453,7 +1455,8 @@ funproto:
> > > > >  	      P.clt2mcode "(" lp, args, vararg, P.clt2mcode ")"
> > > > > rp,
> > > > >  	      P.clt2mcode ";" pt)) }
> > > > >  | i=Tinline s=storage t=ctype
> > > > > -  id=fn_ident lp=TOPar arglist=arg_list(name_opt_decl)
> > > > > rp=TCPar
> > > > > pt=TPtVirg
> > > > > +  TFunProto id=fn_ident
> > > > > +  lp=TOPar arglist=arg_list(name_opt_decl) rp=TCPar
> > > > > pt=TPtVirg
> > > > >        { let s = [Ast0.FStorage s] in
> > > > >          let i = [Ast0.FInline (P.clt2mcode "inline" i)] in
> > > > >  	let t = [Ast0.FType t] in
> > > > > --
> > > > > 2.21.1
> > > > > 
> > > > > 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
